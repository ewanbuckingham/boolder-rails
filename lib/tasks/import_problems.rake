# lib/tasks/import_problems.rake
require "csv"

namespace :problems do
  desc "Import or update problems from a CSV file into the database"

  task import: :environment do
    file_path = ENV["FILE"] || "import/problems.csv"
    timestamp = Time.now.in_time_zone("London") # BST

    unless File.exist?(file_path)
      puts "❌ CSV file not found at #{file_path}"
      exit
    end

    puts "📥 Importing problems from #{file_path}..."
    puts "🕒 Timestamp: #{timestamp.strftime('%Y-%m-%d %H:%M:%S.%6N')}"

    # Inspect headers first to verify
    headers = CSV.read(file_path, headers: true).headers
    puts "🔹 CSV headers detected: #{headers.inspect}"

    CSV.foreach(file_path, headers: true) do |row|
      # Remove BOM/whitespace from header keys
      row = row.to_h.transform_keys { |k| k.to_s.strip.gsub("\uFEFF", "") }

      # Convert values and handle presence
      id              = row["id"].to_i
      name            = row["name"].presence
      grade           = row["grade"].presence
      steepness       = row["steepness"].presence
      area_id         = row["area_id"].to_i if row["area_id"].present?
      circuit_id      = row["circuit_id"].presence
      circuit_number  = row["circuit_number"].presence

      # Skip invalid IDs
      if id <= 0
        puts "⚠️ Skipping row with invalid ID: #{row.inspect}"
        next
      end

      begin
        problem = Problem.find_by(id: id)

        if problem
          # Update existing record
          problem.update!(
            name: name,
            grade: grade,
            updated_at: timestamp,
            circuit_id: circuit_id,
            circuit_number: circuit_number,
            steepness: steepness,
            area_id: area_id
          )
          puts "🔁 Updated problem ##{id} - #{name || '(unnamed)'}"
        else
          # Create new record
          Problem.create!(
            id: id,
            name: name,
            grade: grade,
            created_at: timestamp,
            updated_at: timestamp,
            circuit_id: circuit_id,
            circuit_number: circuit_number,
            steepness: steepness,
            area_id: area_id
          )
          puts "✅ Created problem ##{id} - #{name || '(unnamed)'}"
        end

      rescue ActiveRecord::RecordNotUnique => e
        puts "⚠️ Skipping duplicate problem ##{id}: already exists (#{e.message})"
      rescue StandardError => e
        puts "❌ Error with problem ##{id}: #{e.class} - #{e.message}"
      end
    end

    puts "🎉 Import finished!"
  end
end

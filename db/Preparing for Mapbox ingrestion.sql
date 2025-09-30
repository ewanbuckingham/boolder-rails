WITH top_problems AS (
    SELECT *
    FROM public.problems
    ORDER BY id
    -- LIMIT 100
)
SELECT
    p.id,
    COALESCE(
        p.name,
        COALESCE(INITCAP(c.color), '') || 
        CASE 
            WHEN c.color IS NOT NULL AND p.circuit_number IS NOT NULL THEN ' '
            ELSE ''
        END ||
        COALESCE(p.circuit_number::text, '')
    ) AS name,
    p.grade,
    p.created_at,
    p.updated_at,
    p.circuit_id,
    c.color AS "circuitColor", 
    COALESCE(p.circuit_number::text, '') AS circuit_number,  -- updated to replace NULL with empty string
    --p.steepness,
    --p.height,
    p.area_id,
    --p.bleau_info_id,
    --p.landing,
    --p.featured,
    p.parent_id,
    --p.ratings_average,
    --p.ratings,
    --p.ascents,
    --p.popularity,
    p.circuit_letter,
    --p.sit_start,
    --p.has_line,
    ST_X(p.location::geometry) AS longitude,
    ST_Y(p.location::geometry) AS latitude
FROM top_problems p
LEFT JOIN public.circuits c
    ON p.circuit_id = c.id;

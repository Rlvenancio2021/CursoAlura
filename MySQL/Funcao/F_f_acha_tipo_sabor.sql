CREATE DEFINER=`root`@`localhost` FUNCTION `f_acha_tipo_sabor`(vSabor VARCHAR(50)) RETURNS varchar(20) CHARSET utf8mb4
BEGIN
	DECLARE vRetorno VARCHAR(20) DEFAULT "";
     CASE vSabor
		WHEN 'Lima/Limão' THEN SET vRetorno =  'Cítrico';
        WHEN 'Laranja' THEN SET vRetorno =  'Cítrico';
        WHEN 'Morango/Limão' THEN SET vRetorno =  'Cítrico';
        WHEN 'Uva' THEN SET vRetorno =  'Neutro';
        WHEN 'Morango' THEN SET vRetorno =  'Neutro';
        ELSE SET vRetorno =  'Ácido';
	END CASE;
    RETURN vRetorno;
END
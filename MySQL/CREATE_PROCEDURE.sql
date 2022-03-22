USE `sucos_vendas`;
DROP procedure IF EXISTS `sucos_vendas`.`alo_mundo_2`;
;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `alo_mundo_2`()
BEGIN
SELECT 'Alô Mundo !!!!, tudo bem?' AS RESULTADO;
END$$

DELIMITER ;
;
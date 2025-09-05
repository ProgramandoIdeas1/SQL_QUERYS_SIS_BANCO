USE [BD_Soli]
GO

CREATE PROCEDURE [soli].[ACCOUNT_BCP_GetAllAccount] @CELL_NUMBER_VC VARCHAR(8)
AS
/************************************************************************
*Descripcion:															*
*Fecha Creacion: 28/06/2017												*
*Fecha Modificacion: 27/07/2018											*
*Autor: Braian Javier Espejo Peralta (S22715)							*
*Versión: Beta 															*
*Versión: Gama| Wilson Luque F. (BC2548)								*
*Fecha Modificacion: 20/07/2022							                *
*************************************************************************/
BEGIN
	SELECT CN.ACBC_NUMBER_VC AS [ACBC_NUMBER_VC]
		,CN.ACBC_COIN_VC AS [ACBC_COIN_VC]
		,CN.ACBC_TYPE_VC AS [ACBC_TYPE_VC]
	FROM soli.CELLPHONE CE
	INNER JOIN soli.ACCOUNT_BCP CN ON CE.CELL_ID_IT = CN.ACBC_CELL_ID_IT
	WHERE CE.CELL_NUMBER_VC = LTRIM(RTRIM(@CELL_NUMBER_VC))
		AND CN.ACBC_BLOCKADE_VC = 'A'
END
CREATE OR ALTER FUNCTION SGH.fn_TotalAvaliacoesMedico
    (@cc VARCHAR(20))
RETURNS INT
AS
BEGIN
    RETURN (
        SELECT COUNT(*) FROM SGH.Avaliacao WHERE CC_Medico = @cc
    );
END;
GO
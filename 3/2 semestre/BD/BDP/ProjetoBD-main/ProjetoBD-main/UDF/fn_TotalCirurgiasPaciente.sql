CREATE OR ALTER FUNCTION SGH.fn_TotalCirurgiasPaciente
    (@cc VARCHAR(20))
RETURNS INT
AS
BEGIN
    RETURN (
        SELECT COUNT(*) FROM SGH.Cirurgia WHERE CC_Paciente = @cc
    );
END;
GO
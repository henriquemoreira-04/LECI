CREATE OR ALTER FUNCTION SGH.fn_TipoSalaLabel
    (@id INT)
RETURNS TABLE
AS
RETURN (
    SELECT CAST(Identificador AS VARCHAR) + ' — ' + Designacao AS Label
    FROM SGH.Tipo_de_Sala
    WHERE Identificador = @id
);
GO
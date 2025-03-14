using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace TQ.Proveedores.Infraestructure.Migrations
{
    public partial class inicial : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "EP_CalendarioTQ",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    NombrePeriodo = table.Column<string>(type: "nvarchar(15)", maxLength: 15, nullable: false),
                    FechaInicio = table.Column<DateTime>(type: "datetime2", nullable: false),
                    FechaFin = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Mes = table.Column<int>(type: "int", nullable: false),
                    Trimestre = table.Column<int>(type: "int", nullable: false),
                    Anio = table.Column<int>(type: "int", nullable: false),
                    CreateTime = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "getdate()"),
                    UpdateTime = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "getdate()"),
                    UpdatedBy = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false, defaultValue: "Default"),
                    CreatedBy = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false, defaultValue: "Default")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EP_CalendarioTQ", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "EP_Causal",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Nombre = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: false),
                    Descripcion = table.Column<string>(type: "nvarchar(240)", maxLength: 240, nullable: false),
                    CreateTime = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "getdate()"),
                    UpdateTime = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "getdate()"),
                    UpdatedBy = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false, defaultValue: "Default"),
                    CreatedBy = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false, defaultValue: "Default")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EP_Causal", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "EP_Evaluacion",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    NombrePeriodo = table.Column<string>(type: "nvarchar(15)", maxLength: 15, nullable: false),
                    IndicadorFecha = table.Column<decimal>(type: "decimal(5,1)", precision: 5, scale: 1, nullable: false, defaultValue: 0m),
                    IndicadorCantidad = table.Column<decimal>(type: "decimal(5,1)", precision: 5, scale: 1, nullable: false, defaultValue: 0m),
                    IndicadorCalidad = table.Column<decimal>(type: "decimal(5,1)", precision: 5, scale: 1, nullable: false, defaultValue: 0m),
                    IndicadorCumplimiento = table.Column<decimal>(type: "decimal(5,1)", precision: 5, scale: 1, nullable: false, defaultValue: 0m),
                    Estado = table.Column<int>(type: "int", nullable: false, defaultValue: 1),
                    CreateTime = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "getdate()"),
                    UpdateTime = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "getdate()"),
                    UpdatedBy = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false, defaultValue: "Default"),
                    CreatedBy = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false, defaultValue: "Default")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EP_Evaluacion", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "EP_Parametro",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Nombre = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: false),
                    Descripcion = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: true),
                    CreateTime = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "getdate()"),
                    UpdateTime = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "getdate()"),
                    UpdatedBy = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false, defaultValue: "Default"),
                    CreatedBy = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false, defaultValue: "Default")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EP_Parametro", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "EP_Proveedor",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Nit = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: false),
                    RazonSocial = table.Column<string>(type: "nvarchar(240)", maxLength: 240, nullable: false),
                    ListaCorreoElectronico = table.Column<string>(type: "nvarchar(max)", maxLength: 5000, nullable: false),
                    CreateTime = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "getdate()"),
                    UpdateTime = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "getdate()"),
                    UpdatedBy = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false, defaultValue: "Default"),
                    CreatedBy = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false, defaultValue: "Default")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EP_Proveedor", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "EP_Rol",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Nombre = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    CreateTime = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "getdate()"),
                    UpdateTime = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "getdate()"),
                    UpdatedBy = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false, defaultValue: "Default"),
                    CreatedBy = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false, defaultValue: "Default")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EP_Rol", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "EP_ParametroDetalle",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    NumCampo = table.Column<int>(type: "int", nullable: false),
                    Nombre = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: false),
                    Descripcion = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: true),
                    ParametroId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    CreateTime = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "getdate()"),
                    UpdateTime = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "getdate()"),
                    UpdatedBy = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false, defaultValue: "Default"),
                    CreatedBy = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false, defaultValue: "Default")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EP_ParametroDetalle", x => x.Id);
                    table.ForeignKey(
                        name: "FK_EP_ParametroDetalle_EP_Parametro_ParametroId",
                        column: x => x.ParametroId,
                        principalTable: "EP_Parametro",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "EP_ParametroValor",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Campo1 = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    Campo2 = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    Campo3 = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    Campo4 = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    Campo5 = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    Campo6 = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    Campo7 = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    Campo8 = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    Campo9 = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    Campo10 = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    ParametroId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    CreateTime = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "getdate()"),
                    UpdateTime = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "getdate()"),
                    UpdatedBy = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false, defaultValue: "Default"),
                    CreatedBy = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false, defaultValue: "Default")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EP_ParametroValor", x => x.Id);
                    table.ForeignKey(
                        name: "FK_EP_ParametroValor_EP_Parametro_ParametroId",
                        column: x => x.ParametroId,
                        principalTable: "EP_Parametro",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "EP_PlanAccion",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Periodo = table.Column<string>(type: "nvarchar(15)", maxLength: 15, nullable: false),
                    CompromisoCorporativoId = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: false),
                    ProveedorId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    CreateTime = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "getdate()"),
                    UpdateTime = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "getdate()"),
                    UpdatedBy = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false, defaultValue: "Default"),
                    CreatedBy = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false, defaultValue: "Default")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EP_PlanAccion", x => x.Id);
                    table.ForeignKey(
                        name: "FK_EP_PlanAccion_EP_Proveedor_ProveedorId",
                        column: x => x.ProveedorId,
                        principalTable: "EP_Proveedor",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "EP_Usuario",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    NombreUsuario = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    Nombre = table.Column<string>(type: "nvarchar(150)", maxLength: 150, nullable: true),
                    Apellido = table.Column<string>(type: "nvarchar(150)", maxLength: 150, nullable: true),
                    CorreoElectronico = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
                    RolId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    JefeDirectoId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    CreateTime = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "getdate()"),
                    UpdateTime = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "getdate()"),
                    UpdatedBy = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false, defaultValue: "Default"),
                    CreatedBy = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false, defaultValue: "Default")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EP_Usuario", x => x.Id);
                    table.ForeignKey(
                        name: "FK_EP_Usuario_EP_Rol_RolId",
                        column: x => x.RolId,
                        principalTable: "EP_Rol",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_EP_Usuario_EP_Usuario_JefeDirectoId",
                        column: x => x.JefeDirectoId,
                        principalTable: "EP_Usuario",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "EP_OrdenCompra",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    NumOC = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: false),
                    UnidadProductiva = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: true),
                    FechaCreacion = table.Column<DateTime>(type: "datetime2", nullable: false),
                    ProveedorId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    CompradorId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    CodInsumoServ = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: false),
                    DescInsumoServ = table.Column<string>(type: "nvarchar(240)", maxLength: 240, nullable: true),
                    TipoInsumo = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: false),
                    Moneda = table.Column<string>(type: "nvarchar(10)", maxLength: 10, nullable: false),
                    UnidadMedida = table.Column<string>(type: "nvarchar(25)", maxLength: 25, nullable: true),
                    CompraDesarrollo = table.Column<bool>(type: "bit", nullable: false, defaultValue: false),
                    TipoOC = table.Column<string>(type: "nvarchar(10)", maxLength: 10, nullable: false),
                    CreateTime = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "getdate()"),
                    UpdateTime = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "getdate()"),
                    UpdatedBy = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false, defaultValue: "Default"),
                    CreatedBy = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false, defaultValue: "Default")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EP_OrdenCompra", x => x.Id);
                    table.ForeignKey(
                        name: "FK_EP_OrdenCompra_EP_Proveedor_ProveedorId",
                        column: x => x.ProveedorId,
                        principalTable: "EP_Proveedor",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_EP_OrdenCompra_EP_Usuario_CompradorId",
                        column: x => x.CompradorId,
                        principalTable: "EP_Usuario",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "EP_EVALUACION_OC",
                columns: table => new
                {
                    EvaluacionesId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    OrdenesCompraId = table.Column<Guid>(type: "uniqueidentifier", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EP_EVALUACION_OC", x => new { x.EvaluacionesId, x.OrdenesCompraId });
                    table.ForeignKey(
                        name: "FK_EP_EVALUACION_OC_EP_Evaluacion_EvaluacionesId",
                        column: x => x.EvaluacionesId,
                        principalTable: "EP_Evaluacion",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_EP_EVALUACION_OC_EP_OrdenCompra_OrdenesCompraId",
                        column: x => x.OrdenesCompraId,
                        principalTable: "EP_OrdenCompra",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "EP_Evento",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    NumOC = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: false),
                    FechaDespacho = table.Column<DateTime>(type: "datetime2", nullable: false),
                    FechaRecepcion = table.Column<DateTime>(type: "datetime2", nullable: false),
                    LeadTimeMaestra = table.Column<int>(type: "int", nullable: false, defaultValue: 0),
                    LeadTimeCalculado = table.Column<int>(type: "int", nullable: false, defaultValue: 0),
                    LeadTimeReal = table.Column<int>(type: "int", nullable: false, defaultValue: 0),
                    Dias = table.Column<int>(type: "int", nullable: false, defaultValue: 0),
                    DiasAtraso = table.Column<int>(type: "int", nullable: false, defaultValue: 0),
                    CantidadSolicitada = table.Column<decimal>(type: "decimal(19,5)", precision: 19, scale: 5, nullable: false, defaultValue: 0m),
                    CantidadRecibida = table.Column<decimal>(type: "decimal(19,5)", precision: 19, scale: 5, nullable: false, defaultValue: 0m),
                    CantidadAceptada = table.Column<decimal>(type: "decimal(19,5)", precision: 19, scale: 5, nullable: false, defaultValue: 0m),
                    CantidadRechazada = table.Column<decimal>(type: "decimal(19,5)", precision: 19, scale: 5, nullable: false, defaultValue: 0m),
                    CantidadDevuelta = table.Column<decimal>(type: "decimal(19,5)", precision: 19, scale: 5, nullable: false, defaultValue: 0m),
                    Consignado = table.Column<bool>(type: "bit", nullable: false, defaultValue: false),
                    Urgencia = table.Column<bool>(type: "bit", nullable: false, defaultValue: false),
                    EntregaDirecta = table.Column<int>(type: "int", nullable: false, defaultValue: 0),
                    CodigoCalidad = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    IndicadorFecha = table.Column<decimal>(type: "decimal(5,1)", precision: 5, scale: 1, nullable: false, defaultValue: 0m),
                    IndicadorFechaSys = table.Column<decimal>(type: "decimal(5,1)", precision: 5, scale: 1, nullable: false, defaultValue: 0m),
                    IndicadorCantidad = table.Column<decimal>(type: "decimal(5,1)", precision: 5, scale: 1, nullable: false, defaultValue: 0m),
                    IndicadorCantidadSys = table.Column<decimal>(type: "decimal(5,1)", precision: 5, scale: 1, nullable: false, defaultValue: 0m),
                    IndicadorCalidad = table.Column<decimal>(type: "decimal(5,1)", precision: 5, scale: 1, nullable: false, defaultValue: 0m),
                    IndicadorCalidadSys = table.Column<decimal>(type: "decimal(5,1)", precision: 5, scale: 1, nullable: false, defaultValue: 0m),
                    IndicadorCumplimiento = table.Column<decimal>(type: "decimal(5,1)", precision: 5, scale: 1, nullable: false, defaultValue: 0m),
                    IndicadorCumplimientoDefinitivo = table.Column<decimal>(type: "decimal(5,1)", precision: 5, scale: 1, nullable: false, defaultValue: 0m),
                    Comentario = table.Column<string>(type: "nvarchar(4000)", maxLength: 4000, nullable: true),
                    OrdenCompraId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    CausalId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    CreateTime = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "getdate()"),
                    UpdateTime = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "getdate()"),
                    UpdatedBy = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false, defaultValue: "Default"),
                    CreatedBy = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false, defaultValue: "Default")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EP_Evento", x => x.Id);
                    table.ForeignKey(
                        name: "FK_EP_Evento_EP_Causal_CausalId",
                        column: x => x.CausalId,
                        principalTable: "EP_Causal",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_EP_Evento_EP_OrdenCompra_OrdenCompraId",
                        column: x => x.OrdenCompraId,
                        principalTable: "EP_OrdenCompra",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_EP_EVALUACION_OC_OrdenesCompraId",
                table: "EP_EVALUACION_OC",
                column: "OrdenesCompraId");

            migrationBuilder.CreateIndex(
                name: "IX_EP_Evento_CausalId",
                table: "EP_Evento",
                column: "CausalId");

            migrationBuilder.CreateIndex(
                name: "IX_EP_Evento_OrdenCompraId",
                table: "EP_Evento",
                column: "OrdenCompraId");

            migrationBuilder.CreateIndex(
                name: "IX_EP_OrdenCompra_CompradorId",
                table: "EP_OrdenCompra",
                column: "CompradorId");

            migrationBuilder.CreateIndex(
                name: "IX_EP_OrdenCompra_ProveedorId",
                table: "EP_OrdenCompra",
                column: "ProveedorId");

            migrationBuilder.CreateIndex(
                name: "IX_EP_ParametroDetalle_ParametroId",
                table: "EP_ParametroDetalle",
                column: "ParametroId");

            migrationBuilder.CreateIndex(
                name: "IX_EP_ParametroValor_ParametroId",
                table: "EP_ParametroValor",
                column: "ParametroId");

            migrationBuilder.CreateIndex(
                name: "IX_EP_PlanAccion_ProveedorId",
                table: "EP_PlanAccion",
                column: "ProveedorId");

            migrationBuilder.CreateIndex(
                name: "IX_EP_Usuario_JefeDirectoId",
                table: "EP_Usuario",
                column: "JefeDirectoId");

            migrationBuilder.CreateIndex(
                name: "IX_EP_Usuario_RolId",
                table: "EP_Usuario",
                column: "RolId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "EP_CalendarioTQ");

            migrationBuilder.DropTable(
                name: "EP_EVALUACION_OC");

            migrationBuilder.DropTable(
                name: "EP_Evento");

            migrationBuilder.DropTable(
                name: "EP_ParametroDetalle");

            migrationBuilder.DropTable(
                name: "EP_ParametroValor");

            migrationBuilder.DropTable(
                name: "EP_PlanAccion");

            migrationBuilder.DropTable(
                name: "EP_Evaluacion");

            migrationBuilder.DropTable(
                name: "EP_Causal");

            migrationBuilder.DropTable(
                name: "EP_OrdenCompra");

            migrationBuilder.DropTable(
                name: "EP_Parametro");

            migrationBuilder.DropTable(
                name: "EP_Proveedor");

            migrationBuilder.DropTable(
                name: "EP_Usuario");

            migrationBuilder.DropTable(
                name: "EP_Rol");
        }
    }
}

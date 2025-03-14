using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace TQ.Proveedores.Infraestructure.Data.Migrations
{
    public partial class CreateTableSolicitudCambioEstado : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "EP_SolicitudCambioEstado",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    CompradorId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    ProveedorId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Periodo = table.Column<string>(type: "nvarchar(5)", maxLength: 6, nullable: false),
                    Estado = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: false),
                    Observaciones = table.Column<string>(type: "nvarchar(2000)", maxLength: 2000, nullable: true),
                    FechaCreacion = table.Column<DateTime>(type: "datetime2", nullable: false),
                    FechaAprobacion = table.Column<DateTime>(type: "datetime2", nullable: true),
                    FechaCierre = table.Column<DateTime>(type: "datetime2", nullable: true),
                    AprobadorId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    CreateTime = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "getdate()"),
                    UpdateTime = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValueSql: "getdate()"),
                    UpdatedBy = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false, defaultValue: "Default"),
                    CreatedBy = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false, defaultValue: "Default")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EP_SolicitudCambioEstado", x => x.Id);
                    table.ForeignKey(
                        name: "FK_EP_SolicitudCambioEstado_EP_Proveedor_ProveedorId",
                        column: x => x.ProveedorId,
                        principalTable: "EP_Proveedor",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_EP_SolicitudCambioEstado_EP_Usuario_AprobadorId",
                        column: x => x.AprobadorId,
                        principalTable: "EP_Usuario",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_EP_SolicitudCambioEstado_EP_Usuario_CompradorId",
                        column: x => x.CompradorId,
                        principalTable: "EP_Usuario",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_EP_SolicitudCambioEstado_AprobadorId",
                table: "EP_SolicitudCambioEstado",
                column: "AprobadorId");

            migrationBuilder.CreateIndex(
                name: "IX_EP_SolicitudCambioEstado_CompradorId",
                table: "EP_SolicitudCambioEstado",
                column: "CompradorId");

            migrationBuilder.CreateIndex(
                name: "IX_EP_SolicitudCambioEstado_ProveedorId",
                table: "EP_SolicitudCambioEstado",
                column: "ProveedorId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "EP_SolicitudCambioEstado");
        }
    }
}

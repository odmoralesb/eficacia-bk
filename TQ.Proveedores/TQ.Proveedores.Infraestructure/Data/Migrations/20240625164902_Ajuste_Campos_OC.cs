using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace TQ.Proveedores.Infraestructure.Migrations
{
    public partial class Ajuste_Campos_OC : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "EP_EVALUACION_OC");

            migrationBuilder.AlterColumn<string>(
                name: "Moneda",
                table: "EP_OrdenCompra",
                type: "nvarchar(10)",
                maxLength: 10,
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(10)",
                oldMaxLength: 10);

            migrationBuilder.AddColumn<int>(
                name: "OrganizacionId",
                table: "EP_OrdenCompra",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateTable(
                name: "EP_Evaluacion_OrdenCompra", 
                columns: table => new
                {
                    EvaluacionesId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    OrdenesCompraId = table.Column<Guid>(type: "uniqueidentifier", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EP_Evaluacion_OrdenCompra", x => new { x.EvaluacionesId, x.OrdenesCompraId });
                    table.ForeignKey(
                        name: "FK_EP_Evaluacion_OrdenCompra_EP_Evaluacion_EvaluacionesId",
                        column: x => x.EvaluacionesId,
                        principalTable: "EP_Evaluacion",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_EP_Evaluacion_OrdenCompra_EP_OrdenCompra_OrdenesCompraId",
                        column: x => x.OrdenesCompraId,
                        principalTable: "EP_OrdenCompra",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_EP_Evaluacion_OrdenCompra_OrdenesCompraId",
                table: "EP_Evaluacion_OrdenCompra",
                column: "OrdenesCompraId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "EP_Evaluacion_OrdenCompra");

            migrationBuilder.DropColumn(
                name: "OrganizacionId",
                table: "EP_OrdenCompra");

            migrationBuilder.AlterColumn<string>(
                name: "Moneda",
                table: "EP_OrdenCompra",
                type: "nvarchar(10)",
                maxLength: 10,
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "nvarchar(10)",
                oldMaxLength: 10,
                oldNullable: true);

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

            migrationBuilder.CreateIndex(
                name: "IX_EP_EVALUACION_OC_OrdenesCompraId",
                table: "EP_EVALUACION_OC",
                column: "OrdenesCompraId");
        }
    }
}

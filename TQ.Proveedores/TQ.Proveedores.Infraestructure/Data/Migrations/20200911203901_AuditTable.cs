using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace TQ.Proveedores.Infraestructure.Migrations
{
    public partial class AuditTable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "UserAudit",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    UserName = table.Column<string>(maxLength: 256, nullable: false),
                    Action = table.Column<string>(maxLength: 100, nullable: false),
                    Entity = table.Column<string>(maxLength: 100, nullable: false),
                    EntityId = table.Column<string>(maxLength: 50, nullable: false),
                    ModifiedProperties = table.Column<string>(nullable: true),
                    Ip = table.Column<string>(maxLength: 40, nullable: true),
                    ActionDate = table.Column<DateTime>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserAudit", x => x.Id);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "UserAudit");
        }
    }
}

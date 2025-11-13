using GuestbookApp.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection; // <-- Add this using directive

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllersWithViews();

builder.Services.AddDbContext<GuestbookContext>(options =>
    options.UseSqlite("Data Source=Guestbook.db"));

var app = builder.Build();

app.UseStaticFiles();
app.UseRouting();
app.MapDefaultControllerRoute();
app.Run();
app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Message}/{action=Index}/{id?}");
using Microsoft.EntityFrameworkCore;
using GuestbookApp.Models;

namespace GuestbookApp.Data
{
    public class GuestbookContext : DbContext
    {
        public GuestbookContext(DbContextOptions<GuestbookContext> options)
            : base(options)
        {
        }

        // Use singular `Message` DbSet to match controller expectations.
        public DbSet<Message> Message { get; set; }
    }
}
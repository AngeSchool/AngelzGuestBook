using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;
using GuestbookApp.Models;
using GuestbookApp.Data;

namespace GuestbookApp.Models
{
    public class Message
    {
        public int Id { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        public string Content { get; set; }

        public DateTime PostedAt { get; set; } = DateTime.Now;
    }
}
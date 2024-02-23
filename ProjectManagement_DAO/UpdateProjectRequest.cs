using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectManagement_DAO
{
    public class UpdateProjectRequest
    {
        public int GroupId { get; set; }
        public string Name { get; set; } = null!;
        public string Customer { get; set; } = null!;
        public string Status { get; set; } = null!;
        public DateTime StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public List<string>? Employees { get; set; }
    }
}

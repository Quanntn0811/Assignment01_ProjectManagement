using ProjectManagement_BusinessObjects.Entites;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectManagement_Repository.interfaces
{
    public interface IGroupRepo
    {
        public IEnumerable<Group> GetGroups();
        public void AddNew(Group group);
        public void Update(int id, Group group);
        public void Delete(int id);
    }
}

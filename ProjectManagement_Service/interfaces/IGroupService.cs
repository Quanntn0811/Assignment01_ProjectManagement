using ProjectManagement_BusinessObjects.Entites;
using ProjectManagement_DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectManagement_Service.interfaces
{
    public interface IGroupService
    {
        public IEnumerable<Group> GetGroups();
        public void AddNew(Group group);
        public void Update(int id, Group group);
        public void Delete(int id);
    }
}

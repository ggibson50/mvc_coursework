using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList;

namespace DealershipWebsite.ViewModels
{
    public class VehicleSearchResults
    {
        public string Search { get; set; }
        public int? MinYear { get; set; }
        public int? MaxYear { get; set; }
        public string SortBy { get; set; }

        public IPagedList<VehicleInfo> Results { get; set; }
    }
}
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ConsoleUI
{
    using System;
    using System.Collections.Generic;
    
    public partial class Kontigent
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Kontigent()
        {
            this.FakturaNummer = new HashSet<FakturaNummer>();
        }
    
        public int kontigent_id { get; set; }
        public Nullable<int> kontigent_pris { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FakturaNummer> FakturaNummer { get; set; }
    }
}

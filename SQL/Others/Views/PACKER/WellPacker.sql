select a.UWI as "Well ID",
    a.PACKER_ID as "Packer ID",
    a.DATA_SOURCE as "Data Source",
    a.PACKER_TYPE as "Packer Type",
    a.PACKER_DEPTH as "Packer Depth",
    a.INSTALL_DATE as "Install Date",
    a.REMOVAL_DATE as "Removal Date",
    a.PACKER_MANUFACTURER as "Packer Manufacturer",
    a.PACKER_SIZE as "Packer Size",
    a.PACKER_LENGTH as "Packer Length",
    a.INTERNAL_DIAMETER as "Internal Diameter",
    a.MATERIAL as Material,
    a.CREATE_DATE as "Create Date",
    a.CREATE_USER_ID as "Create User ID",
    a.UPDATE_USER_ID as "Update User ID",
    a.UPDATE_DATE as "Update Date",
    a.REMARK as Remark,
    a.PACKER_DEPTH_OUOM as "Packer Depth OUOM",
    a.PACKER_SIZE_OUOM as "Packer Size OUOM",
    a.PACKER_LENGTH_OUOM as "Packer Length OUOM",
    a.INTERNAL_DIAMETER_OUOM as "Internal Diameter OUOM"
    from DBA.PACKER as a
    ORDER BY "Well ID"
    , "Packer ID"
    ;
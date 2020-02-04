
/*QUERY_NAME: MRBTS_DATA*/
SELECT _log_.cliente.name AS CUSTOMER,
   _xml_.MRBTS.dateTime as DATE,
   _xml_.MRBTS._MRBTS as MRBTS,
   _xml_.LNBTS._LNBTS as LNBTS,
   _xml_.LNBTS.mcc AS MCC,
   _xml_.LNBTS.mnc AS MNC,
   _xml_.LNBTS.name AS NAME,
   _xml_.LNBTS._version AS VERSION,
   (SELECT COUNT(_xml_.RMOD.distName) FROM _xml_.RMOD WHERE 
      _xml_.RMOD._MRBTS = _xml_.MRBTS._MRBTS AND 
      _xml_.RMOD.customerId = _xml_.MRBTS.customerId AND
      _xml_.RMOD.file_uuid = _xml_.MRBTS.file_uuid ) AS RMOD,   
   (SELECT COUNT(_xml_.RMOD_R.distName) FROM _xml_.RMOD_R WHERE 
      _xml_.RMOD_R._MRBTS = _xml_.MRBTS._MRBTS AND 
      _xml_.RMOD_R.customerId = _xml_.MRBTS.customerId AND
      _xml_.RMOD_R.file_uuid = _xml_.MRBTS.file_uuid ) AS RMOD_R,
   (SELECT COUNT(_xml_.SMOD.distName) FROM _xml_.SMOD WHERE 
      _xml_.SMOD._MRBTS = _xml_.MRBTS._MRBTS AND 
      _xml_.SMOD.customerId = _xml_.MRBTS.customerId AND
      _xml_.SMOD.file_uuid = _xml_.MRBTS.file_uuid ) AS SMOD,      
   (SELECT COUNT(_xml_.SMOD_R.distName) FROM _xml_.SMOD_R WHERE 
      _xml_.SMOD_R._MRBTS = _xml_.MRBTS._MRBTS AND 
      _xml_.SMOD_R.customerId = _xml_.MRBTS.customerId AND
      _xml_.SMOD_R.file_uuid = _xml_.MRBTS.file_uuid ) AS SMOD_R,      
   (SELECT COUNT(_xml_.SMOD_EXT_R.distName) FROM _xml_.SMOD_EXT_R WHERE 
      _xml_.SMOD_EXT_R._MRBTS = _xml_.MRBTS._MRBTS AND 
      _xml_.SMOD_EXT_R.customerId = _xml_.MRBTS.customerId AND
      _xml_.SMOD_EXT_R.file_uuid = _xml_.MRBTS.file_uuid ) AS SMOD_EXT_R,
   (SELECT _xml_.IPNO.mPlaneIpAddress FROM _xml_.IPNO WHERE 
      _xml_.IPNO._MRBTS = _xml_.MRBTS._MRBTS AND 
      _xml_.IPNO.customerId = _xml_.MRBTS.customerId AND
      _xml_.IPNO.file_uuid = _xml_.MRBTS.file_uuid AND
      _xml_.IPNO._LNBTS = _xml_.LNBTS._LNBTS AND 
      _xml_.IPNO.customerId = _xml_.LNBTS.customerId AND
      _xml_.IPNO.file_uuid = _xml_.LNBTS.file_uuid) AS OAM_IP_ADDR,
   (SELECT _xml_.IPNO.cPlaneIpAddress FROM _xml_.IPNO WHERE 
      _xml_.IPNO._MRBTS = _xml_.MRBTS._MRBTS AND 
      _xml_.IPNO.customerId = _xml_.MRBTS.customerId AND
      _xml_.IPNO._LNBTS = _xml_.LNBTS._LNBTS AND 
      _xml_.IPNO.customerId = _xml_.LNBTS.customerId AND
      _xml_.IPNO.file_uuid = _xml_.LNBTS.file_uuid ) AS CPLANE_IP_ADDR,
   (SELECT _xml_.IPNO.uPlaneIpAddress FROM _xml_.IPNO WHERE 
      _xml_.IPNO._MRBTS = _xml_.MRBTS._MRBTS AND 
      _xml_.IPNO.customerId = _xml_.MRBTS.customerId AND
      _xml_.IPNO.file_uuid = _xml_.MRBTS.file_uuid AND
      _xml_.IPNO._LNBTS = _xml_.LNBTS._LNBTS AND 
      _xml_.IPNO.customerId = _xml_.LNBTS.customerId AND
      _xml_.IPNO.file_uuid = _xml_.LNBTS.file_uuid ) AS USER_IP_ADDR, 
   (SELECT _xml_.IPNO.sPlaneIpAddress FROM _xml_.IPNO WHERE 
      _xml_.IPNO._MRBTS = _xml_.MRBTS._MRBTS AND 
      _xml_.IPNO.customerId = _xml_.MRBTS.customerId AND
      _xml_.IPNO.file_uuid = _xml_.MRBTS.file_uuid AND
      _xml_.IPNO._LNBTS = _xml_.LNBTS._LNBTS AND 
      _xml_.IPNO.customerId = _xml_.LNBTS.customerId AND
      _xml_.IPNO.file_uuid = _xml_.LNBTS.file_uuid ) AS SYNCH_IP_ADDR,
   (SELECT _xml_.IPNO.oamIpAddr FROM _xml_.IPNO WHERE 
      _xml_.IPNO._MRBTS = _xml_.MRBTS._MRBTS AND 
      _xml_.IPNO.customerId = _xml_.MRBTS.customerId AND
      _xml_.IPNO.file_uuid = _xml_.MRBTS.file_uuid AND
      _xml_.IPNO._LNBTS = _xml_.LNBTS._LNBTS AND 
      _xml_.IPNO.customerId = _xml_.LNBTS.customerId AND
      _xml_.IPNO.file_uuid = _xml_.LNBTS.file_uuid) AS OMS_IP_MAIN,
   (SELECT _xml_.IPNO.secOmsIpAddr FROM _xml_.IPNO WHERE 
      _xml_.IPNO._MRBTS = MRBTS._MRBTS AND 
      _xml_.IPNO.customerId = _xml_.MRBTS.customerId AND
      _xml_.IPNO.file_uuid = _xml_.MRBTS.file_uuid AND
      _xml_.IPNO._LNBTS = _xml_.LNBTS._LNBTS AND 
      _xml_.IPNO.customerId = _xml_.LNBTS.customerId AND
      _xml_.IPNO.file_uuid = _xml_.LNBTS.file_uuid ) AS OMS_IP_SEC,                                                
   (SELECT _xml_.FTM.locationName FROM _xml_.FTM WHERE 
      _xml_.FTM._LNBTS = _xml_.LNBTS._LNBTS AND
      _xml_.FTM._MRBTS = _xml_.LNBTS._MRBTS AND
      _xml_.FTM.file_uuid = _xml_.LNBTS.file_uuid AND
      _xml_.FTM.customerId = _xml_.LNBTS.customerId ) AS LOCATION
FROM _log_.cliente, _xml_.MRBTS, _xml_.LNBTS WHERE
   _xml_.LNBTS._MRBTS = _xml_.MRBTS._MRBTS AND
   _xml_.LNBTS.customerId = _xml_.MRBTS.customerId AND
   _xml_.LNBTS.file_uuid = _xml_.MRBTS.file_uuid AND
   _xml_.MRBTS.customerId = _log_.cliente.id AND 
   (_xml_.MRBTS._RNC IS NULL OR _xml_.MRBTS._RNC = "-") AND  
   _log_.cliente.id AND _log_.cliente.id = _cid_ ;


/*QUERY_NAME: LNCEL_DATA*/
SELECT _log_.cliente.name AS CUSTOMER,
   _xml_.MRBTS.name AS MRBTS_NAME,
   _xml_.MRBTS._MRBTS AS MRBTS_ID,
   _xml_.LNBTS._LNBTS AS LNBTS_ID,
   _xml_.LNBTS.name AS LNBTS_NAME,
   _xml_.LNBTS._version AS SW_VERSION,
   _xml_.LNCEL._LNCEL AS LNCEL_ID,
   _xml_.LNCEL.name AS LNCEL_NAME,
   _xml_.LNCEL.MCC AS MCC,
   _xml_.LNCEL.MNC AS MNC,
   _xml_.LNCEL.TAC AS TAC,
   _xml_.LNCEL.eutraCelId AS EUTRACELL_ID
FROM _xml_.LNCEL, _xml_.LNBTS, _xml_.MRBTS, _log_.cliente WHERE
   _xml_.LNCEL._LNBTS = _xml_.LNBTS._LNBTS AND
   _xml_.LNCEL._MRBTS = _xml_.LNBTS._MRBTS AND
   _xml_.LNCEL.customerId = _xml_.LNBTS.customerId AND
   _xml_.LNBTS._MRBTS = _xml_.MRBTS._MRBTS AND
   _xml_.LNBTS.customerId = _xml_.MRBTS.customerId AND
   _xml_.MRBTS.customerId = _log_.cliente.id AND
   _log_.cliente.id = _cid_ ;
   

/*QUERY_NAME: SMOD*/   
SELECT _xml_.SMOD.dateTime AS DATE,
   (SELECT _xml_.MRBTS.name FROM _xml_.MRBTS WHERE
      _xml_.SMOD.customerId = _xml_.SMOD.customerID AND
      _xml_.SMOD.file_uuid = _xml_.SMOD.file_uuid AND
      _xml_.SMOD.distName LIKE CONCAT(_xml_.MRBTS.distName, '%') LIMIT 1) AS MRBTS_NAME,
   _xml_.SMOD._MRBTS AS MRBTS_ID,
   _xml_.SMOD._version AS VERSION,
   _xml_.SMOD.prodCode AS PRODUCT_CODE,
   _xml_.SMOD.serialNumber AS SERIAL_NUMBER   
FROM _xml_.SMOD
WHERE
     (_xml_.SMOD._RNC IS NULL OR _xml_.SMOD._RNC = "-") AND  
     _xml_.SMOD.customerId = _cid_ ;

/*QUERY_NAME: SMOD_R*/        
SELECT _xml_.SMOD_R.dateTime AS DATE,
   (SELECT _xml_.MRBTS.name FROM _xml_.MRBTS WHERE
      _xml_.SMOD_R.customerId = _xml_.SMOD_R.customerID AND
      _xml_.SMOD_R.file_uuid = _xml_.SMOD_R.file_uuid AND
      _xml_.SMOD_R.distName LIKE CONCAT(_xml_.MRBTS.distName, '%') LIMIT 1) AS MRBTS_NAME,
   _xml_.SMOD_R._MRBTS AS MRBTS_ID,
   _xml_.SMOD_R._version AS VERSION,
   _xml_.SMOD_R.productCode AS PRODUCT_CODE,
   _xml_.SMOD_R.serialNumber AS SERIAL_NUMBER   
FROM _xml_.SMOD_R
WHERE
     (_xml_.SMOD_R._RNC IS NULL OR _xml_.SMOD_R._RNC = "-") AND  
     _xml_.SMOD_R.customerId = _cid_ ;  

/*QUERY_NAME: SMOD_EXT_R*/        
SELECT _xml_.SMOD_EXT_R.dateTime AS DATE,
   (SELECT _xml_.MRBTS.name FROM _xml_.MRBTS WHERE
      _xml_.SMOD_EXT_R.customerId = _xml_.SMOD_EXT_R.customerID AND
      _xml_.SMOD_EXT_R.file_uuid = _xml_.SMOD_EXT_R.file_uuid AND
      _xml_.SMOD_EXT_R.distName LIKE CONCAT(_xml_.MRBTS.distName, '%') LIMIT 1) AS MRBTS_NAME,
   _xml_.SMOD_EXT_R._MRBTS AS MRBTS_ID,
   _xml_.SMOD_EXT_R._version AS VERSION,
   _xml_.SMOD_EXT_R.productCode AS PRODUCT_CODE,
   _xml_.SMOD_EXT_R.serialNumber AS SERIAL_NUMBER   
FROM _xml_.SMOD_EXT_R
WHERE
    (_xml_.SMOD_EXT_R._RNC IS NULL OR _xml_.SMOD_EXT_R._RNC = "-") AND  
     _xml_.SMOD_EXT_R.customerId = _cid_ ;  
   

/*QUERY_NAME: RMOD*/   
SELECT _xml_.RMOD.dateTime AS DATE,
   (SELECT _xml_.MRBTS.name FROM _xml_.MRBTS WHERE
      _xml_.RMOD.customerId = _xml_.RMOD.customerID AND
      _xml_.RMOD.file_uuid = _xml_.RMOD.file_uuid AND
      _xml_.RMOD.distName LIKE CONCAT(_xml_.MRBTS.distName, '%') LIMIT 1) AS MRBTS_NAME,
   _xml_.RMOD._MRBTS AS MRBTS_ID,
   _xml_.RMOD._version AS VERSION,
   _xml_.RMOD.prodCode AS PRODUCT_CODE,
   _xml_.RMOD.serialNumber AS SERIAL_NUMBER   
FROM _xml_.RMOD
WHERE
     (_xml_.RMOD._RNC IS NULL OR _xml_.RMOD._RNC = "-") AND  
     _xml_.RMOD.customerId = _cid_ ;  
     

/*QUERY_NAME: RMOD_R*/   
SELECT _xml_.RMOD_R.dateTime AS DATE,
   (SELECT _xml_.MRBTS.name FROM _xml_.MRBTS WHERE
      _xml_.RMOD_R.customerId = _xml_.RMOD_R.customerID AND
      _xml_.RMOD_R.file_uuid = _xml_.RMOD_R.file_uuid AND
      _xml_.RMOD_R.distName LIKE CONCAT(_xml_.MRBTS.distName, '%') LIMIT 1) AS MRBTS_NAME,
   _xml_.RMOD_R._MRBTS AS MRBTS_ID,
   _xml_.RMOD_R._version AS VERSION,
   _xml_.RMOD_R.productCode AS PRODUCT_CODE,
   _xml_.RMOD_R.serialNumber AS SERIAL_NUMBER   
FROM _xml_.RMOD_R
WHERE
     (_xml_.RMOD_R._RNC IS NULL OR _xml_.RMOD_R._RNC = "-") AND  
     _xml_.RMOD_R.customerId = _cid_ ;        
   

/*QUERY_NAME: MRBTS_Vlans*/
SELECT _log_.cliente.name AS CUSTOMER,
   _xml_.MRBTS.dateTime AS DATE,
   _xml_.LNBTS._MRBTS AS MRBTS_ID,
   _xml_.LNBTS.name AS MRBTS_NAME,
   _xml_.LNBTS._LNBTS AS LNBTS_ID,
   _xml_.LNBTS.name AS LNBTS_NAME,
   _xml_.IVIF.vlanId AS VLAN_ID,
   _xml_.IVIF.localIpAddr AS IP_ADDR,
   _xml_.IVIF.netmask AS NETMASK
FROM _log_.cliente, 
   _xml_.MRBTS, 
   _xml_.LNBTS, 
   _xml_.IVIF, 
   _xml_.IEIF, 
   _xml_.IPNO, 
   _xml_.FTM 
WHERE
   _xml_.IVIF._IEIF = _xml_.IEIF._IEIF AND
   _xml_.IVIF._IPNO = _xml_.IEIF._IPNO AND
   _xml_.IVIF._FTM = _xml_.IEIF._FTM AND
   _xml_.IVIF._LNBTS = _xml_.IEIF._LNBTS AND
   _xml_.IVIF._MRBTS = _xml_.IEIF._MRBTS AND
   _xml_.IVIF.customerId = _xml_.IEIF.customerId AND
   _xml_.IEIF._IPNO = _xml_.IPNO._IPNO AND
   _xml_.IEIF._FTM = _xml_.IPNO._FTM AND
   _xml_.IEIF._LNBTS = _xml_.IPNO._LNBTS AND
   _xml_.IEIF._MRBTS = _xml_.IPNO._MRBTS AND
   _xml_.IEIF.customerId = _xml_.IPNO.customerId AND
   _xml_.IPNO._FTM = _xml_.FTM._FTM AND 
   _xml_.IPNO._LNBTS = _xml_.FTM._LNBTS AND
   _xml_.IPNO._MRBTS = _xml_.FTM._MRBTS AND
   _xml_.IPNO.customerID = _xml_.FTM.customerId AND
   _xml_.FTM._LNBTS = _xml_.LNBTS._LNBTS AND
   _xml_.FTM._MRBTS = _xml_.LNBTS._MRBTS AND
   _xml_.FTM.customerId = _xml_.LNBTS.customerID AND
   _xml_.LNBTS._MRBTS = _xml_.MRBTS._MRBTS AND
   _xml_.MRBTS.customerId = _xml_.MRBTS.customerId AND
   _xml_.MRBTS.customerId = _log_.cliente.id AND
   (_xml_.MRBTS._RNC IS NULL OR _xml_.MRBTS._RNC = "-") AND
   _log_.cliente.id = _cid_ ;

/*QUERY_NAME: MRBTS_MME*/
SELECT _xml_.LNMME.dateTime AS DATE,
   _xml_.LNMME._MRBTS AS MRBTS_ID,
   (SELECT _xml_.MRBTS.name FROM _xml_.MRBTS WHERE
   _xml_.LNMME.distName LIKE CONCAT('%', _xml_.MRBTS.distName, '%') AND
   _xml_.LNMME.customerId = _xml_.MRBTS.customerId LIMIT 1) AS MRBTS_NAME,   
   _xml_.LNMME._LNBTS AS LNBTS_ID,
   _xml_.LNMME._LNMME AS LNMME_ID,
   _xml_.LNMME.ipAddrPrim AS MME_IP_ADDR_PRIM,
   _xml_.LNMME.s1LinkStatus AS LINK_STATUS,
   _xml_.LNMME_accMmePlmnsList.mcc AS MCC,
   _xml_.LNMME_accMmePlmnsList.mnc AS MNC
FROM _xml_.LNMME, _xml_.LNMME_accMmePlmnsList
WHERE 
   _xml_.LNMME_accMmePlmnsList.distName = _xml_.LNMME.distName AND
   _xml_.LNMME_accMmePlmnsList.customerId = _xml_.LNMME.customerId AND
   _xml_.LNMME.customerId = _cid_ ;
   
   
/*QUERY_NAME: MRBTS_StaticRoutes*/
SELECT _xml_.IPRT.dateTime AS DATE,
   _xml_.IPRT._MRBTS AS MRBTS_ID,
(SELECT _xml_.MRBTS.name FROM _xml_.MRBTS WHERE
   _xml_.IPRT.distName LIKE CONCAT(_xml_.MRBTS.distName, '%') AND
   _xml_.IPRT.customerId = _xml_.MRBTS.customerId LIMIT 1) AS MRBTS_NAME,     
   _xml_.IPRT._LNBTS AS LNBTS_ID,   
   _xml_.IPRT_staticRoutes.destIpAddr AS DESTINATION_ADDRESS,
   _xml_.IPRT_staticRoutes.gateway AS GATEWAY,
   _xml_.IPRT_staticRoutes.netmask AS NETMASK,
   _xml_.IPRT_staticRoutes.preference AS PREFERENCE
FROM _xml_.IPRT,
   _xml_.IPRT_staticRoutes   
WHERE
   (_xml_.IPRT._RNC = '-' OR _xml_.IPRT._RNC IS NULL) AND
   _xml_.IPRT_staticRoutes.distName = _xml_.IPRT.distName AND
   _xml_.IPRT_staticRoutes.customerId = _xml_.IPRT.customerId AND
   _xml_.IPRT.customerId = _cid_;   
   

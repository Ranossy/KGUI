function CanHaveExteriorSecondRepresent(player, dwExteriorID)
    if dwExteriorID == 4274 then
    
    
    	local dwRepresentID1 = player.GetRepresentID(EQUIPMENT_REPRESENT.CHEST_STYLE)  --��װ
			local dwRepresentID2 = player.GetRepresentID(EQUIPMENT_REPRESENT.L_SHOULDER_EXTEND)  --���
			local dwRepresentID3 = player.GetRepresentID(EQUIPMENT_REPRESENT.R_SHOULDER_EXTEND)  --�Ҽ�
			local dwRepresentID4 = player.GetRepresentID(EQUIPMENT_REPRESENT.BACK_CLOAK_EXTEND)  --����

			if dwRepresentID1 == 555  and dwRepresentID2 == 107  and dwRepresentID3 == 107  and dwRepresentID4 == 60 then
					return true
			end
			
      --  if player.dwBackCloakItemIndex == 18381 and player.dwLShoulderItemIndex == 18372 and player.dwRShoulderItemIndex == 18373 then
      --     return true
      --  end
      
      return false
    end
    
    if dwExteriorID == 4275 then
    
      local dwRepresentID1 = player.GetRepresentID(EQUIPMENT_REPRESENT.CHEST_STYLE)  --��װ
			local dwRepresentID2 = player.GetRepresentID(EQUIPMENT_REPRESENT.L_SHOULDER_EXTEND)  --���
			local dwRepresentID3 = player.GetRepresentID(EQUIPMENT_REPRESENT.R_SHOULDER_EXTEND)  --�Ҽ�
			local dwRepresentID4 = player.GetRepresentID(EQUIPMENT_REPRESENT.BACK_CLOAK_EXTEND)  --����
			if dwRepresentID1 == 556  and dwRepresentID2 == 106  and dwRepresentID3 == 106  and dwRepresentID4 == 61 then
					return true
			end
      --  if player.dwBackCloakItemIndex == 18382 and player.dwLShoulderItemIndex == 18370 and player.dwRShoulderItemIndex == 18371 then
      --     return true
      --  end
        return false
    end
    
    return true
end


 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
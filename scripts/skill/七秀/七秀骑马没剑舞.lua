function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
    local character
    local tplayer
    local npc
    if IsPlayer(nCharacterID) then
        tplayer = GetPlayer(nCharacterID);
    else
        npc = GetNpc(nCharacterID);
    end

	if not (nLeftFrame == 0) then
	  for i = 1,7 do
		tplayer.DelBuff(2352,i)
	  end
		tplayer.AddBuff(0,99,3901,1,1)--end 
	end
end;
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
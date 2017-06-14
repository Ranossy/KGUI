function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
    local character
    local player
    local npc
        
    if IsPlayer(nCharacterID) then
        player = GetPlayer(nCharacterID);
    else
        npc = GetNpc(nCharacterID);
    end

    if nLeftFrame == 0 then -- 正常结束，剩余时间为0，则换BUFF
    	for n = 1,7 do
	    	if BuffID == 409 and nBuffLevel <= 5*n - 2 and  nBuffLevel >= 5*n - 4 then
	    			player.AddBuff(player.dwID,player.nLevel,409,nBuffLevel+1)
					--player.nAccumulateValue  = player.nAccumulateValue + 1
					player.AddBuff(player.dwID,player.nLevel,3892,1,1)
	    			return
				end
			end
	  else
		for i = 1,7 do
			tplayer.DelBuff(2352,i)
		end
			tplayer.AddBuff(0,99,3901,1,1)--end
		
	  end
end;
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
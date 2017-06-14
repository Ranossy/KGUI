function Apply(dwCharacterID)	
		local npc = GetNpc(dwCharacterID)
		local scene = npc.GetScene()
		local npcBOSS = scene.GetNpcByNickName("asaxin")
		local player = nil
	if not scene then
			return
	end		
	if not npcBOSS then 
		return
	end
	if not npc then
		return
	end
	local Target = npc.GetCustomInteger4(1)
	local player = GetPlayer(Target)
	if not player then
		return
	end
	local npc2 = scene.GetNpcByNickName("suolian_"..player.dwID)
	if not npc2 then
			player.DelBuff(2243,1)
			npc.Die()
			return
	end
	  if player.nCurrentLife <= 100 or not player.GetBuff(2243,1) then
				npc.CastSkill(2189,1)
					npcBOSS.DelBuff(2708,1)
				player.Die()
				npc.Die()
				if npc2 then
	 					local scene = npc2.GetScene()
						npc2.DoAction(0, 10065)
						npc2.SetDisappearFrames(32)
						local npcNameTable = { "1", "2", "3" }
						local npcSelected = RandomSelectNpc(scene, npcNameTable, 1)
						if npcSelected then
								npcSelected.SetCustomBoolean(1, 1)
						else
								return
						end
				end
	  end
end
function UnApply(dwCharacterID)
end
function RandomSelectNpc(scene, nickNameTable, customValueIndex)
	local tempNickNameTable = {}
	
	for i = 1, #nickNameTable do
		local nickName = nickNameTable[i]
		local npc = scene.GetNpcByNickName(nickName)
		
		if npc and not npc.GetCustomBoolean(customValueIndex) then
			tempNickNameTable[#tempNickNameTable + 1] = nickName	
		end
	end
	
	if #tempNickNameTable == 0 then
	
		return nil
	end

	local randomIndex = Random(#tempNickNameTable)
	local selectedNickName = tempNickNameTable[randomIndex]
	local npcSelected = scene.GetNpcByNickName(selectedNickName)
		
	return npcSelected
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
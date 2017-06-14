function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	if not IsPlayer(nCharacterID) then
		local npc = GetNpc(nCharacterID)
		if not npc then
			return
		end
		local scene = npc.GetScene()
		if not scene then
			return
		end
		if scene.dwMapID == 121 then
			scene.CreateDoodad(2916, 17741, 14828, 1111207, 0, "JunQi_2_1")
			return
		end
	else
		local cPlayer = GetPlayer(nCharacterID)
		if cPlayer then
			local scene = cPlayer.GetScene()
			if not scene then
				return
			end
			if scene.dwMapID == 121 then
				scene.CreateDoodad(2916, 17741, 14828, 1111207, 0, "JunQi_2_1")
			end
		end
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
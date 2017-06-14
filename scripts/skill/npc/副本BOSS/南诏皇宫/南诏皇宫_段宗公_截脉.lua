
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local cPlayer = GetPlayer(nCharacterID)
	if not cPlayer then
		return
	end
	local scene = cPlayer.GetScene()
	if not scene then
		return
	end
	--local cNpc = scene.GetNpcByNickName("duanzonggong")
	local cNpc = scene.GetNpcByNickName("zuoshao")
	if not cNpc then
		return
	end
	if nLeftFrame == 0 then
		if scene.dwMapID == 140 then
			cNpc.CastSkill(4254, 1, TARGET.PLAYER, nCharacterID)
		end
		if scene.dwMapID == 155 then
			cNpc.CastSkill(4254, 2, TARGET.PLAYER, nCharacterID)
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
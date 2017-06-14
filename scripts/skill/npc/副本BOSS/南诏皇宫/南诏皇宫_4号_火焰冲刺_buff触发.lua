
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	local scene = npc.GetScene()
	if not scene then
		return
	end
	local playerID = npc.GetCustomInteger4(0)
	local cPlayer = GetPlayer(playerID)
	if not cPlayer then
		return
	end
	npc.SetCustomBoolean(8, false)
	npc.SetTarget(TARGET.PLAYER, playerID)
	if npc.GetCustomInteger4(0) ~= npc.GetCustomInteger4(12) then
		npc.CastSkill(4825, 1, TARGET.PLAYER, playerID)
	end
	scene.SetTimer(0.5 * GLOBAL.GAME_FPS, "scripts/Skill/npc/����BOSS/��گ�ʹ�/��گ�ʹ�_4��_������_buff����.lua", npc.dwID, 1)
end

function OnTimer(scene, nParam1, nParam2)
	local npc = GetNpc(nParam1)
	if npc then
		local Fplayertarget = GetPlayer(npc.GetCustomInteger4(12))
		if Fplayertarget then
			if scene.dwMapID == 140 then
				npc.CastSkill(4828, 1, TARGET.PLAYER, Fplayertarget.dwID)
			elseif scene.dwMapID == 155 then
				npc.CastSkill(4828, 2, TARGET.PLAYER, Fplayertarget.dwID)
			end
			npc.PlaySfx(242, Fplayertarget.nX, Fplayertarget.nY, 1118080)
		end
	end
end
-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
------------------------------------------------
-- ������   :  �ź�		
-- ����ʱ��	:  2011-3-10
-- Ч����ע	:  ɳ������ؼ���
------------------------------------------------

function Apply(dwCharacterID)
	local n = 0
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	local scene = npc.GetScene()
	local tAllPlayer = scene.GetAllPlayer()
	for i = 1, #tAllPlayer do
		local player = GetPlayer(tAllPlayer[i])
	
		if player and player.nMoveState ~= MOVE_STATE.ON_DEATH then
			if player.GetBuff(2233, 1) then
				n = n + 1
			end
		end
	end
	if n == 0 then
		npc.CastSkill(2178,1)
	else
		npc.CastSkill(2178,n)
	end
end
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/������/������_��ׯ_�����μ��.lua
-- ����ʱ��:	2014/5/26 16:58:44
-- �����û�:	ks13376-PC
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	local scene = player.GetScene()
	local huadiweilao = scene.GetNpcByNickName("huadiweilao")
	if huadiweilao then
		if GetCharacterDistance(huadiweilao.dwID, player.dwID) <= 192 then
			if player.nMoveState ~= MOVE_STATE.ON_DEATH then
				if not player.GetBuff(7874, 1) then
					player.AddBuff(0, 99, 7874, 1, 28800)
				end
	
				if player.GetBuff(208, 1) then
					player.DelBuff(208, 1)
				end
	
				if player.GetBuff(1900, 1) then
					player.DelBuff(1900, 1)
				end
	
				if not player.GetBuff(7876, 1) then
					player.AddBuff(0, 99, 7876, 1, 600)
				end
			end
		end
	end
end

function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
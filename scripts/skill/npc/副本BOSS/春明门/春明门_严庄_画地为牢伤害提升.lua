---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/������/������_��ׯ_����Ϊ���˺�����.lua
-- ����ʱ��:	2014/5/27 15:53:57
-- �����û�:	ks13376-PC
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	if player.GetBuff(7876, 1) then
		if player.GetBuff(7876, 1).nLeftActiveCount <= 595 and player.GetBuff(7876, 1).nLeftActiveCount > 590 then
			if not player.GetBuff(7877, 1) then
				player.AddBuff(0, 99, 7877, 1, 600)
			end
		end

		if player.GetBuff(7876, 1).nLeftActiveCount <= 590 and player.GetBuff(7876, 1).nLeftActiveCount > 585 then
			player.DelBuff(7877, 1)
			if not player.GetBuff(7878, 1) then
				player.AddBuff(0, 99, 7878, 1, 600)
			end
		end

		if player.GetBuff(7876, 1).nLeftActiveCount <= 585 then
			player.DelBuff(7878, 1)
			if not player.GetBuff(7941, 1) then
				player.AddBuff(0, 99, 7941, 1, 600)
			end
		end
	end
end

function UnApply(dwCharacterID)

end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���ֺ���/����֢.lua
-- ����ʱ��:	2017/4/1 22:40:18
-- �����û�:	CHENGSIHAN
-- �ű�˵��:
----------------------------------------------------------------------<

-- ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	local linghushang = scene.GetNpcByNickName("linghushang")
	if linghushang and player and player.bFightState then
		if player.GetBuff(11849, 1) then
			local Nbuff = player.GetBuff(11849, 1)
			local Num = Nbuff.nStackNum
			if Num >= 10 and Num < 15 then
				if not player.GetBuff(11850, 1) then
					player.AddBuff(player.dwID, player.nLevel, 11850, 1)
				end
				if not player.GetBuff(11791, 1) then
					player.AddBuff(player.dwID, player.nLevel, 11791, 1)
				end
			end
			if Num >= 15 and Num < 20 then
				player.DelBuff(11850, 1)
				if not player.GetBuff(11851, 1) then
					player.AddBuff(player.dwID, player.nLevel, 11851, 1)
				end
				if not player.GetBuff(11791, 1) then
					player.AddBuff(player.dwID, player.nLevel, 11791, 1)
				end
			end
			if Num == 20 then
				player.DelBuff(11851, 1)
				if not player.GetBuff(11852, 1) then
					player.AddBuff(player.dwID, player.nLevel, 11852, 1)
				end
				if not player.GetBuff(11791, 1) then
					player.AddBuff(player.dwID, player.nLevel, 11791, 1)
				end
			end
		end
	end
end
-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
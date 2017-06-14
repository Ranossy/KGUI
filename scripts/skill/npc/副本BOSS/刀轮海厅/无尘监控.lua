---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/player/����BOSS/���ֺ���/�޳����.lua
-- ����ʱ��:	2017/4/1 21:45:00
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
	if player then
		if player.GetBuff(11846, 1) then
			local Nbuff = player.GetBuff(11846, 1)
			local Num = Nbuff.nStackNum
			if Num == 5 then
				player.DelGroupBuff(11846, 1)
				player.AddBuff(player.dwID, player.nLevel, 11844, 1)
			end
		end
	end
end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
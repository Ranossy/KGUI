---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����_������������.lua
-- ����ʱ��:	2016/12/5 16:55:26
-- �����û�:	qinfupi
-- �ű�˵��:
----------------------------------------------------------------------<

Include("scripts/skill/Map/���ǰ�ȫ��/���ǰ�ȫ����.lh")

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	local buff = player.GetBuff(11549, 0)
	
	if CheckIfCitySafeArea(player) then
		if buff.nLevel == 1 and buff.nLeftActiveCount == 1	 then	--�ж�buff�����һ����ת��Ϊ����buff
			player.DelBuff(11549, 1)
			player.AddBuff(0, 99, 11549, 2, 180)
		end
	else
		player.DelBuff(11549, buff.nLevel)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
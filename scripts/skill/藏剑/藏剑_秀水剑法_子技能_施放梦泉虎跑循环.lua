---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�ؽ�/�ؽ�_��ˮ����_�Ӽ���_ʩ����Ȫ����ѭ��.lua
-- ����ʱ��:	2013/5/29 21:02:24
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local dwSkillLevel = player.GetSkillLevel(1589)   --���ĸ���� ��Ȫ���� �ĵȼ�

	--��������Ŀ��
	if player.GetSkillLevel(6544) ~= 1 then
		player.CastSkill(1592, 1)
	end
	if player.GetBuff(1702, 1) then
		player.DelBuff(1702, 1)
		player.AddBuff(0, 99, 1593, 1)
		player.AddBuff(0, 99, 1702, 2)
	elseif player.GetBuff(1702, 2) then
		player.DelBuff(1702, 2)
		player.AddBuff(0, 99, 1593, 1)
		player.AddBuff(0, 99, 1702, 3)
	elseif player.GetBuff(1702, 3) then
		player.DelBuff(1702, 3)
		player.AddBuff(0, 99, 1593, 1)
		player.AddBuff(0, 99, 1702, 4)
	else player.GetBuff(1702, 4)
		player.DelBuff(1702, 4)
		player.AddBuff(0, 99, 1593, 1)
		player.AddBuff(0, 99, 1702, 1)
	end	
	player.CastSkill(1591, dwSkillLevel)
end

function UnApply(dwCharacterID)

end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
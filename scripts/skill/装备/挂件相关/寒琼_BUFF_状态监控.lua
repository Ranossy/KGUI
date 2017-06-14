---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ����/����_BUFF_״̬���.lua
-- ����ʱ��:	2016/8/19 10:59:33
-- �����û�:	jiangzhefei1
-- �ű�˵��:
----------------------------------------------------------------------<

-- ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
function Apply(dwCharacterID)
	--���BUFF��NPC�������
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	if player.dwBackItemIndex ~= 18380 then
		player.DelBuff(11115, 1)
		return
	end
	
	local buff = player.GetBuff(1575, 16)
	if buff then
		--if player.GetDynamicSkillGroup() == 0 then
			player.SetDynamicSkillGroup(302)
		--end
	else
		player.DelBuff(11115, 1)
	end
end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	local buff_san = player.GetBuff(1575, 0)
	if buff_san then
		player.DelBuff(1575, buff_san.nLevel)
	end
	
	if player.GetDynamicSkillGroup() == 302 then
		player.SetDynamicSkillGroup(0)
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
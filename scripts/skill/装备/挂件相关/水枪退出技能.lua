---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ����/ˮǹ�˳�����.lua
-- ����ʱ��:	2015/7/1 1:51:48
-- �����û�:	zhangyan3
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{

};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/װ��/�Ҽ����/ˮǹ�˳�����.lua",
		0
	);

	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 4 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ

	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	if player.GetDynamicSkillGroup() ~= 0 then
		player.SetDynamicSkillGroup(0)
	end

	player.DelBuff(9153, 1)
	
	player.DelBuff(9163, 1)
	player.DelBuff(9164, 1)
	player.DelBuff(9165, 1)
	player.DelBuff(9166, 1)

	player.Jump(1, 0)

	player.SetTimer(0.6 * 16, "scripts/skill/װ��/�Ҽ����/ˮǹ�˳�����.lua", 0, 0)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnTimer(player, nParam1, nParam2)
	if player.dwBackItemIndex == 13905 then
		player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 275)
	end
	if player.dwBackItemIndex == 13906 then
		player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 276)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
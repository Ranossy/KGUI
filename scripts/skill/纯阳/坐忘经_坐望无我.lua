---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/������_��������.lua
-- ����ʱ��:	2017/3/18 21:10:49
-- �����û�:	XIAXIANBO1
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ������_��������.lua
-- ������    :  kingbeyond
-- ����ʱ��  :  2007-12-11
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  ������
-- ��������  :  ��������
-- ����Ч��  :  ��һ��ʱ���ڽ��ܵ����˺�������������
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nBuffID = 134, nBuffLevel = 1, nCostMana = 52}, --level 1
	{nBuffID = 134, nBuffLevel = 2, nCostMana = 82}, --level 2
	{nBuffID = 134, nBuffLevel = 3, nCostMana = 136}, --level 3
	{nBuffID = 134, nBuffLevel = 4, nCostMana = 173}, --level 4
	{nBuffID = 134, nBuffLevel = 5, nCostMana = 209}, --level 5
	{nBuffID = 134, nBuffLevel = 6, nCostMana = 246}, --level 6
	{nBuffID = 134, nBuffLevel = 7, nCostMana = 282}, --level 7
	{nBuffID = 134, nBuffLevel = 8, nCostMana = 282}, --level 8
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel

	--QC�˺�������ͨ
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL, -- ħ������
		134, -- ����ֵ1
		dwSkillLevel															-- ����ֵ2
	);

	--QC�˺����ռ�ǿ
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL, -- ħ������
		6090, -- ����ֵ1
		dwSkillLevel															-- ����ֵ2
	);
	--JC�˺�������ͨ
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL, -- ħ������
		8867, -- ����ֵ1
		dwSkillLevel															-- ����ֵ2
	);
	--JC�˺����ռ�ǿ
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL, -- ħ������
		8868, -- ����ֵ1
		dwSkillLevel															-- ����ֵ2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/����/90����Ѩ/�������Ҵ�����.lua", -- ����ֵ1
		0														-- ����ֵ2
	);
	--skill.BindBuff(1, 134, dwSkillLevel)
	--skill.BindBuff(2, 2983, 2)
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);	--����CD
	skill.SetNormalCoolDown(1, 163);	--����CD
	skill.SetCheckCoolDown(1, 444);
	--������λ
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER

	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 0.5 * (1 + dwSkillLevel / 8) * 18;	-- �������ĵ�����
	----------------- ����������� ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = 4 * LENGTH_BASE;						--����ʩ�����뾶
	skill.nAngleRange = 256; 									--ʩ�ŽǶ�

	skill.nPrepareFrames = 0;										--����֡��,16֡����1��

	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡

	skill.nBreakRate = 1024;									--����ϵĸ���,Ĭ��1024��ʾһ�������

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

function OnSkillLevelUp(skill, player)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--ɾ�������ڼ����buff
	player.DelBuff(2983, 1)
	player.DelBuff(2983, 2)
	if player.GetSkillLevel(6467) == 1  then
		player.AddBuff(dwCharacterID, player.nLevel, 6403, 1, 1)
	end

	if player.GetSkillLevel(14830) == 1 then
		player.CastSkill(14988, 1)	--�ظ�5����
		player.AddBuff(player.dwID, player.nLevel, 11815, 1)
	end

	if player.GetSkillLevel(14994) == 1 then
		if player.GetOTActionState() == 1 then
			player.AddBuff(player.dwID, player.nLevel, 8620, 1)
		else
			player.AddBuff(player.dwID, player.nLevel, 9962, 1)
			player.AddBuff(player.dwID, player.nLevel, 10078, 1)
		end
	end

	if player.GetSkillLevel(5813) == 1 then
		player.AddBuff(player.dwID, player.nLevel, 10066, 1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
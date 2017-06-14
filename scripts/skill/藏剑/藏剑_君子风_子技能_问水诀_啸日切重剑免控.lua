---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�ؽ�/�ؽ�_���ӷ�_�Ӽ���_��ˮ��_Х�����ؽ����.lua
-- ����ʱ��:	2015/10/8 17:26:19
-- �����û�:	mengxiangfei11
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  �ؽ�_���ӷ�_�Ӽ���_��ˮ��_Х��.lua
-- ������    :  zhangqi
-- ����ʱ��  :  2010-03-2
-- ��;(ģ��):  �书����
-- �书����  :  �ؽ�
-- �书����  :  �⹦
-- �书��·  :  ���ӷ�
-- ��������  :  Х��
-- ����Ч��  :  ���绽�꣬Х�վ��졣
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 0, nDamage = 14 * 0.95, nDamageRand = 14 * 0.1}, -- Level 1
	{nAddRage = 0, nCostRage = 0, nDamage = 23 * 0.95, nDamageRand = 23 * 0.1}, -- Level 2
	{nAddRage = 0, nCostRage = 0, nDamage = 31 * 0.95, nDamageRand = 31 * 0.1}, -- Level 3
	{nAddRage = 0, nCostRage = 0, nDamage = 39 * 0.95, nDamageRand = 39 * 0.1}, -- Level 4
	{nAddRage = 0, nCostRage = 0, nDamage = 47 * 0.95, nDamageRand = 47 * 0.1}, -- Level 5
	{nAddRage = 0, nCostRage = 0, nDamage = 54 * 0.95, nDamageRand = 54 * 0.1}, -- Level 6
	{nAddRage = 0, nCostRage = 0, nDamage = 62 * 0.95, nDamageRand = 62 * 0.1}, -- Level 7
	{nAddRage = 0, nCostRage = 0, nDamage = 70 * 0.95, nDamageRand = 70 * 0.1}, -- Level 8
	{nAddRage = 0, nCostRage = 0, nDamage = 78 * 0.95, nDamageRand = 78 * 0.1}, -- Level 9
	{nAddRage = 0, nCostRage = 0, nDamage = 86 * 0.95, nDamageRand = 86 * 0.1}, -- Level 10

};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_MULTI_GROUP_BUFF_BY_FUNCTIONTYPE,
		2,
		9999
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_MULTI_GROUP_BUFF_BY_FUNCTIONTYPE,
		3,
		9999
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_MULTI_GROUP_BUFF_BY_FUNCTIONTYPE,
		4,
		9999
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_MULTI_GROUP_BUFF_BY_FUNCTIONTYPE,
		8,
		9999
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_MULTI_GROUP_BUFF_BY_FUNCTIONTYPE,
		7,
		9999
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_MULTI_GROUP_BUFF_BY_FUNCTIONTYPE,
		11,
		9999
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- �������
		ATTRIBUTE_TYPE.CAST_SKILL,
		7276,
		1
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- �������
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/�ؽ�/�ؽ�_���ӷ�_�Ӽ���_��ˮ��_Х�����ؽ����.lua",
		0
	);
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, 1903, 1);			-- ����Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- ����Hot

	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);
	--skill.SetNormalCoolDown(1, 347);
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;

	----------------- ����������� ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	--	skill.nChannelInterval	= 32;
	skill.nMinRadius = 0 * LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius = 4 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 128; 										--ʩ�ŽǶ�,ȫ��256
	--skill.nAreaRadius		= 6 * LENGTH_BASE;
	--skill.nWeaponDamagePercent	= 0;
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��

	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡

	skill.nBreakRate = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
	--	skill.nTargetCountLimit	= 1;
	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)

end

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local nTime = 24
	if player.IsSkillRecipeActive(608, 1) then
		nTime = nTime + 1
	end
	if player.IsSkillRecipeActive(609, 1) then
		nTime = nTime + 1
	end
	if player.IsSkillRecipeActive(610, 1) then
		nTime = nTime + 1
	end

	player.AddBuff(player.dwID, player.nLevel, 1903, 1, nTime)
end

function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
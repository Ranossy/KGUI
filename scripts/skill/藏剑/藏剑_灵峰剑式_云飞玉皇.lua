---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�ؽ�/�ؽ�_��彣ʽ_�Ʒ����.lua
-- ����ʱ��:	2013/7/24 14:26:22
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  �ؽ�_��彣ʽ_�Ʒ����.lua
-- ������    :  zhangqi	
-- ����ʱ��  :  2010-01-28
-- ��;(ģ��):  �书����
-- �书����  :  �ؽ�
-- �书����  :  �⹦
-- �书��·  :  ��彣ʽ
-- ��������  :  �Ʒ����
-- ����Ч��  :  ����϶��Ʋ���������ΰ׳��
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 0, nDamageBase = 88, nDamageRand = 12}, -- Level 1 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 128, nDamageRand = 16}, -- Level 2 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 168, nDamageRand = 20}, -- Level 3 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 208, nDamageRand = 24}, -- Level 4 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 248, nDamageRand = 28}, -- Level 5 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 288, nDamageRand = 32}, -- Level 6 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 328, nDamageRand = 36}, -- Level 7 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 368, nDamageRand = 40}, -- Level 8 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 408, nDamageRand = 44}, -- Level 9 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 448, nDamageRand = 48}, -- Level 10 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 488, nDamageRand = 52}, -- Level 11
	{nAddRage = 0, nCostRage = 0, nDamageBase = 528, nDamageRand = 56}, -- Level 12
	{nAddRage = 0, nCostRage = 0, nDamageBase = 568, nDamageRand = 60}, -- Level 13
	{nAddRage = 0, nCostRage = 0, nDamageBase = 608, nDamageRand = 64}, -- Level 14
	{nAddRage = 0, nCostRage = 0, nDamageBase = 648, nDamageRand = 68}, -- Level 15
	{nAddRage = 0, nCostRage = 0, nDamageBase = 688, nDamageRand = 72}, -- Level 16
};           
             
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1595,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1594,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		2900,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		2899,
		dwSkillLevel
		);
	--ɾ������������buff
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		9849,
		1
	);
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
	--2900,
	--dwSkillLevel
	--);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, ----����Ч����20110613֣����
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1884,
		1
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, ----90����Ч��
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1884,
		2
		);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, ----95����Ч��
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1884,
		3
		);
	--ʹ�ú��ٴ�ɾ�������˲��buff
		skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, ----90����Ч��
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		2704,
		1
		);
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);		
	skill.SetNormalCoolDown(1, 363);
	skill.SetCheckCoolDown(1, 444);
	----------------- ���ü������� ---------------------------------------------------------------------
	skill.nCostRage = 20;
	
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	--skill.nChannelInterval	= 80;
	skill.nMinRadius = 0 * LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius = 8 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 128; 										--ʩ�ŽǶ�,ȫ��256
	skill.nWeaponDamagePercent = 0;
	skill.nPrepareFrames = 32;										--����֡��,16֡����1��
	skill.nMinPrepareFrames = 1;
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
    
	----------------- ���˴��������� -------------------------------------------------
	skill.nBeatBackRate = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	
	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
	if nPreResult == SKILL_RESULT_CODE.SUCCESS then
		player.AddBuff(0, 99, 2027, 1)
		return nPreResult 
	end
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
	--��������ָ��
	--��������ָ������
	--local nQuestIndex = player.GetQuestIndex(13422)
	--local nQuestPhase = player.GetQuestPhase(13422)
	--if nQuestIndex and nQuestPhase == 1 then
		--player.SetQuestValue(nQuestIndex, 0, skill.dwLevel)
	--end
end

--function Apply(dwCharacterID)
--	local player = GetPlayer(dwCharacterID)
--	
--
--	player.DelMultiGroupBuffByFunctionType(4);
--	player.DelMultiGroupBuffByFunctionType(6);
--	player.DelMultiGroupBuffByFunctionType(8);
--	player.DelMultiGroupBuffByFunctionType(7);
--	
--end
--
--function UnApply(dwCharacterID)
--end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
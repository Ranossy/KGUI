---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�ؽ�/���׶����˺�.lua
-- ����ʱ��:	2013/5/13 14:57:26
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  �ؽ�_���ӷ�_����_��ˮ��.lua
-- ������    :  zhangqi	
-- ����ʱ��  :  2010-01-27
-- ��;(ģ��):  �书����
-- �书����  :  �ؽ�
-- �书����  :  �⹦
-- �书��·  :  ���ӷ�
-- ��������  :  ����
-- ����Ч��  :  �������������ȴ�����
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 28, 	nDamageRand = 3}, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 34, 	nDamageRand = 4}, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 40, 	nDamageRand = 4}, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 46, 	nDamageRand = 5}, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 52, 	nDamageRand = 5}, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 58, 	nDamageRand = 6}, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 64, 	nDamageRand = 7}, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 70, 	nDamageRand = 7}, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 76, 	nDamageRand = 8}, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 82, 	nDamageRand = 8}, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 88, 	nDamageRand = 9},   	-- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 94, 	nDamageRand = 10}, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 100, 	nDamageRand = 10}, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 106, 	nDamageRand = 11}, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 112, 	nDamageRand = 11}, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 118, 	nDamageRand = 12}, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 124, 	nDamageRand = 13}, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 130, 	nDamageRand = 13}, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 136, 	nDamageRand = 14}, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 142, 	nDamageRand = 14}, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 148, 	nDamageRand = 15}, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 154, 	nDamageRand = 16}, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 160, 	nDamageRand = 16}, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 166, 	nDamageRand = 17}, -- Level 24 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 172, 	nDamageRand = 17}, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 178, 	nDamageRand = 18}, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 184, 	nDamageRand = 19}, -- Level 27 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 190, 	nDamageRand = 19}, -- Level 28 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 196, 	nDamageRand = 20}, -- Level 29 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 202, 	nDamageRand = 20}, -- Level 30
	{nAddRage = 0, nCostRage = 10, nDamageBase = 208, 	nDamageRand = 21}, -- Level 31 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 214, 	nDamageRand = 22}, -- Level 32 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 220, 	nDamageRand = 22}, -- Level 33 
	
};           
             

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;

--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
--		1894,
--		1
--	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL, -- ħ������
		5732, -- ����ֵ1
		1																	-- ����ֵ2
	);
	skill.AddSlowCheckSelfBuff(5732, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);		
	--skill.SetNormalCoolDown(1, 344);

	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	if dwSkillLevel < 9 then
		skill.nChannelInterval = 16;
	elseif dwSkillLevel < 33 then
		skill.nChannelInterval = 16 + (dwSkillLevel - 8) * 5
	else
		skill.nChannelInterval = 144;     -- ͨ�������ʱ��   
	end
	--skill.nChannelInterval = 144;
	skill.nMinRadius = 0 * LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius = 4 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 128; 										--ʩ�ŽǶ�,ȫ��256
	--skill.nAreaRadius		= 6 * LENGTH_BASE;	
	skill.nWeaponDamagePercent = 1024;
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


 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
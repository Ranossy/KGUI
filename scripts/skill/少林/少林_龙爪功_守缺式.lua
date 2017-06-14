---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����_��צ��_��ȱʽ.lua
-- ����ʱ��:	2013/4/25 17:31:00
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ����_��צ��_��ȱʽ.lua
-- ������    :  �º���	
-- ����ʱ��  :  2008-07-18	
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  ��צ��
-- ��������  :  ��ȱʽ
-- ����Ч��  :  �Ե���Ŀ����ɽϴ�������ڹ��˺�
--                   
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--���ӳ���ݶ��ͼ����˺����
tSkillData = 
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 61, 	nDamageRand = 7}, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 65, 	nDamageRand = 7}, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 69, 	nDamageRand = 8}, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 73, 	nDamageRand = 8}, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 77, 	nDamageRand = 9}, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 81, 	nDamageRand = 9}, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 85, 	nDamageRand = 9}, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 89, 	nDamageRand = 10}, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 93, 	nDamageRand = 10}, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 97, 	nDamageRand = 11}, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 101, 	nDamageRand = 11}, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 105, 	nDamageRand = 11}, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 109, 	nDamageRand = 12}, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 113, 	nDamageRand = 12}, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 117, 	nDamageRand = 13}, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 121, 	nDamageRand = 13}, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 125, 	nDamageRand = 13}, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 129, 	nDamageRand = 14}, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 133, 	nDamageRand = 14}, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 137, 	nDamageRand = 15}, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 141, 	nDamageRand = 15}, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 145, 	nDamageRand = 15}, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 149, 	nDamageRand = 16}, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 153, 	nDamageRand = 16}, -- Level 24 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 157, 	nDamageRand = 17}, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 161, 	nDamageRand = 17}, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 165, 	nDamageRand = 17}, -- Level 27 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 169, 	nDamageRand = 18}, -- Level 28 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 173, 	nDamageRand = 18}, -- Level 29

};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local dwSkillLevel = skill.dwLevel;
	

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_SOLAR_DAMAGE,
		0,
		0
	);
--��1�㷴��ֵ
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.ACCUMULATE,
		1,
		0
	);
--��ս��״̬���1�㷴��ֵ
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_SRC,
		511,
		1
	);
    
	--ʩ�� �Ӽ���_���ֽ����󷨵�����
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		748,
		1
	);   
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);		--����CD1��
	skill.SetNormalCoolDown(1, 50);
	skill.SetCheckCoolDown(1, 444);
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 601 * 0.2;--�������ĵ�����
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 601 * 0.4;
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 601 * 0.6;
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 601 * 0.8;
	else
		skill.nCostManaBasePercent = 601;
	end
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nChannelInterval	= 15; 				-- ͨ�������ʱ��
	if dwSkillLevel < 10 then
		skill.nChannelInterval =64;
	elseif dwSkillLevel < 29 then
		skill.nChannelInterval = 64 + (dwSkillLevel - 8) * 4
	else
		skill.nChannelInterval = 154;     -- ͨ�������ʱ��   
	end
	
	--skill.nChannelInterval = 154;	 			-- ͨ��������ʱ�䣬��λ֡�� 
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
	----------------- ������ -------------------------------------------------
	--skill.nBrokenRate      = 0 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
	--skill.nBreakRate		= 0;					-- ���Ŀ��ʩ���ĸ���,����1024
    
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	
	
	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = 8 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 128; 										--ʩ�ŽǶ�,ȫ��256
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��
	skill.nWeaponDamagePercent = 0;
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   
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
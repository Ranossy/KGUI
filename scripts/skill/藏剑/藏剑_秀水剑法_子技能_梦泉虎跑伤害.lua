---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�ؽ�/�ؽ�_��ˮ����_�Ӽ���_��Ȫ�����˺�.lua
-- ����ʱ��:	2013/5/7 11:36:17
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  �ؽ�_��ˮ����_�Ӽ���_��Ȫ�����˺�.lua
-- ������    :  
-- ����ʱ��  :  
-- ��;(ģ��):  
-- �书����  :  
-- �书����  :  
-- �书��·  :  
-- ��������  :  
-- ����Ч��  :  
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")


tSkillData = 
{
	{nAddRage = 0, nCostRage = 0, nDamageBase = 8, 	nDamageRand = 1}, -- Level 1 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 9, 	nDamageRand = 1}, -- Level 2 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 10, 	nDamageRand = 1}, -- Level 3 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 11, 	nDamageRand = 1}, -- Level 4 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 12, 	nDamageRand = 1}, -- Level 5 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 13, 	nDamageRand = 1}, -- Level 6 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 14, 	nDamageRand = 2}, -- Level 7 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 15, 	nDamageRand = 2}, -- Level 8 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 16, 	nDamageRand = 2}, -- Level 9 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 17, 	nDamageRand = 2}, -- Level 10 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 18, 	nDamageRand = 2},   	-- Level 11
	{nAddRage = 0, nCostRage = 0, nDamageBase = 19, 	nDamageRand = 2}, -- Level 12
	{nAddRage = 0, nCostRage = 0, nDamageBase = 20, 	nDamageRand = 2}, -- Level 13
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	--������ĳ�̼��ܱ��buff����
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		7795,
		1
		);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase*3,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand*3,
		0
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/�ؽ�/�ؽ�_��ˮ����_�Ӽ���_��Ȫ�����˺�.lua", -- ����ֵ1
		0														-- ����ֵ2
	);
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
--    skill.SetPublicCoolDown(16);		--����CD1��

	
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	if dwSkillLevel < 5 then
		skill.nChannelInterval = 32*0.85;
	elseif dwSkillLevel < 13 then
		skill.nChannelInterval =(32 + (dwSkillLevel - 5) *3)*0.85
	else
		skill.nChannelInterval = 64*0.85;     -- ͨ�������ʱ��   
	end
	--skill.nChannelInterval = 64;
	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = 12 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 256; 										--ʩ�ŽǶ�,ȫ��256
    
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��
    
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
    
	--skill.nDismountingRate  = 1024;									--������Ϊ100%
    
	skill.nBreakRate = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
    
	--skill.nStiffFrame		= 16; 
   
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
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	if not target then
		return
	end
	target.AddBuff(dwSkillSrcID, player.nLevel, 5723, 1, 1)
	local lv = player.GetSkillLevel(1589)
	if player.GetSkillLevel(5943) == 1 then
		player.CastSkill(6164, lv)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
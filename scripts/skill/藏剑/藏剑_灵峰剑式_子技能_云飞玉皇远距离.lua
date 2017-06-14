---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�ؽ�/�ؽ�_��彣ʽ_�Ӽ���_�Ʒ����Զ����.lua
-- ����ʱ��:	2013/5/29 19:51:41
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  �ؽ�_��彣ʽ_�Ӽ���_�Ʒ����Զ����.lua
-- ������    :  zhangqi	
-- ����ʱ��  :  2010-01-28
-- ��;(ģ��):  �书����
-- �书����  :  �ؽ�
-- �书����  :  �⹦
-- �书��·  :  
-- ��������  :  
-- ����Ч��  :  
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 0, nDamageBase = 360, 	nDamageRand = 12}, -- Level 1 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 420, 	nDamageRand = 16}, -- Level 2 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 600, 	nDamageRand = 20}, -- Level 3 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 630, 	nDamageRand = 24}, -- Level 4 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 660, 	nDamageRand = 28}, -- Level 5 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 670, 	nDamageRand = 32}, -- Level 6 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 680, 	nDamageRand = 36}, -- Level 7 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 690, 	nDamageRand = 40}, -- Level 8 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 700, 	nDamageRand = 44}, -- Level 9 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 710, 	nDamageRand = 48}, -- Level 10 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 720, 	nDamageRand = 52},   	-- Level 11
	{nAddRage = 0, nCostRage = 0, nDamageBase = 730, 	nDamageRand = 56}, -- Level 12
	{nAddRage = 0, nCostRage = 0, nDamageBase = 740, 	nDamageRand = 60}, -- Level 13
	{nAddRage = 0, nCostRage = 0, nDamageBase = 750, 	nDamageRand = 64}, -- Level 14
	{nAddRage = 0, nCostRage = 0, nDamageBase = 760, 	nDamageRand = 68}, -- Level 15
	{nAddRage = 0, nCostRage = 0, nDamageBase = 770, 	nDamageRand = 72}, -- Level 16
};         
             

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase*0.35,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand*0.35,
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
		"skill/�ؽ�/�ؽ�_��彣ʽ_�Ӽ���_�Ʒ����Զ����.lua", -- ����ֵ1
		0														-- ����ֵ2
	);  
	skill.AddSlowCheckSelfBuff(2682, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);		

	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostRage	= tSkillData[dwSkillLevel].nCostRage;
	
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 100*1.1;
	elseif dwSkillLevel < 16 then
		skill.nChannelInterval = (100 + (dwSkillLevel - 10) *15)*1.1
	else
		skill.nChannelInterval = 200*1.1;     -- ͨ�������ʱ��   
	end
	--skill.nChannelInterval = 200;

	skill.nMinRadius = 0 * LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius = 10 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 128; 										--ʩ�ŽǶ�,ȫ��256
	skill.nWeaponDamagePercent = 2048;
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��
    
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

function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	--[[
	if player.GetSkillLevel(6545) == 1 then
		target.AddBuff(dwSkillSrcID, player.nLevel, 6145, 1, 1)
	end
	--]]
end
--
--function UnApply(dwCharacterID)
--end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
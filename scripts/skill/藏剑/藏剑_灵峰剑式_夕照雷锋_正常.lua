---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�ؽ�/�ؽ�_��彣ʽ_Ϧ���׷�_����.lua
-- ����ʱ��:	2013/4/26 9:44:02
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  �ؽ�_��彣ʽ_Ϧ���׷�.lua
-- ������    :  zhangqi	
-- ����ʱ��  :  2010-01-28
-- ��;(ģ��):  �书����
-- �书����  :  �ؽ�
-- �书����  :  �⹦
-- �书��·  :  ��彣ʽ
-- ��������  :  Ϧ���׷�
-- ����Ч��  :  Ϧ��б���׷����������������޺�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 255, 	nDamageRand = 5}, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 280, 	nDamageRand = 8}, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 320, 	nDamageRand = 10}, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 360, 	nDamageRand = 13}, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 370, 	nDamageRand = 16}, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 380, 	nDamageRand = 19}, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 390, 	nDamageRand = 22}, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 400, 	nDamageRand = 24}, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 410, 	nDamageRand = 27}, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 420, 	nDamageRand = 30}, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 430, 	nDamageRand = 33},   	-- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 440, 	nDamageRand = 36}, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 450, 	nDamageRand = 38}, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 460, 	nDamageRand = 41}, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 465, 	nDamageRand = 44}, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 470, 	nDamageRand = 47}, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 493, 	nDamageRand = 50}, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 521, 	nDamageRand = 52}, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 549, 	nDamageRand = 55}, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 577, 	nDamageRand = 58}, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 605, 	nDamageRand = 61}, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 633, 	nDamageRand = 64}, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 661, 	nDamageRand = 66}, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 689, 	nDamageRand = 69}, -- Level 24 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 717, 	nDamageRand = 72}, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 745, 	nDamageRand = 75}, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 773, 	nDamageRand = 78}, -- Level 27 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 801, 	nDamageRand = 80}, -- Level 28   
};           
             

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase*0.25,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand*0.25,
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
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/�ؽ�/�ؽ�_��彣ʽ_Ϧ���׷�_����.lua", -- ����ֵ1
		0														-- ����ֵ2
	);
	
	skill.AddSlowCheckSelfBuff(2682, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);		
	--skill.SetNormalCoolDown(1, 335);
	

	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostRage	= tSkillData[dwSkillLevel].nCostRage;
	
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	--skill.nChannelInterval	= 72;
	skill.nMinRadius = 0 * LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius = 10 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 128; 										--ʩ�ŽǶ�,ȫ��256
	skill.nWeaponDamagePercent = 2048;
	--skill.nPrepareFrames    = 24;
	--����֡��,16֡����1��
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 84;
	elseif dwSkillLevel < 28 then
		skill.nChannelInterval = 84 + (dwSkillLevel - 9) * 5
	else
		skill.nChannelInterval = 180;     -- ͨ�������ʱ��   
	end
	--skill.nChannelInterval = 180;
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
	--[[
	local i = Random(1, 10)
	if i <= 3 then
		if player.GetSkillLevel(5956) == 1 then
			player.nCurrentRage = player.nCurrentRage + 10
		end
	end
	--]]
	local lv = player.GetSkillLevel(1600)
	local target = player.GetSelectCharacter()
	if not target then
		return
	end
	--[[
	if player.GetSkillLevel(5957) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 5729, 1, 1)
		if player.GetBuff(5729, 1).nStackNum == 3 then
			target.AddBuff(dwCharacterID, player.nLevel, 5730, 1, 1)
			player.CastSkill(6168, lv)
			player.DelBuff(5729, 1)
			player.DelBuff(5729, 1)
			player.DelBuff(5729, 1)
		end
	end
	--]]
end
--
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
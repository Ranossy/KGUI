------------------------------------------------
-- �ļ���    :  �ؽ�_��彣ʽ_�Ӽ���_�׹��ɽ������.lua
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
	{nAddRage = 0, nCostRage = 0, nDamageBase = 200, 	nDamageRand = 9}, -- Level 1 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 215, 	nDamageRand = 10}, -- Level 2 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 230, 	nDamageRand = 11}, -- Level 3 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 245, 	nDamageRand = 12}, -- Level 4 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 260, 	nDamageRand = 13}, -- Level 5 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 275, 	nDamageRand = 14}, -- Level 6 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 290, 	nDamageRand = 15}, -- Level 7 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 305, 	nDamageRand = 16}, -- Level 8 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 320, 	nDamageRand = 17}, -- Level 9 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 335, 	nDamageRand = 18}, -- Level 10 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 350, 	nDamageRand = 19},   	-- Level 11
	{nAddRage = 0, nCostRage = 0, nDamageBase = 365, 	nDamageRand = 20}, -- Level 12
	{nAddRage = 0, nCostRage = 0, nDamageBase = 380, 	nDamageRand = 21}, -- Level 13
	{nAddRage = 0, nCostRage = 0, nDamageBase = 395, 	nDamageRand = 22}, -- Level 14
	{nAddRage = 0, nCostRage = 0, nDamageBase = 410, 	nDamageRand = 23}, -- Level 15
	{nAddRage = 0, nCostRage = 0, nDamageBase = 425, 	nDamageRand = 24}, -- Level 16
	{nAddRage = 0, nCostRage = 0, nDamageBase = 440, 	nDamageRand = 25}, -- Level 17
	{nAddRage = 0, nCostRage = 0, nDamageBase = 450, 	nDamageRand = 26}, -- Level 18
};           
             

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase/2, 
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand/2, 
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0, 
		0
	);
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);		

	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostRage	= tSkillData[dwSkillLevel].nCostRage;
	
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	if dwSkillLevel < 9 then
		skill.nChannelInterval = 80*0.7;
	elseif dwSkillLevel < 18 then
		skill.nChannelInterval = (80 + (dwSkillLevel - 8) *8)*0.7
	else
		skill.nChannelInterval = 160*0.7;     -- ͨ�������ʱ��   
	end
	--skill.nChannelInterval	= 160;
	skill.nAreaRadius		= 4 * LENGTH_BASE;		-- �������ð뾶 
	skill.nMinRadius	= 0* LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius        = 4 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange       = 256; 										--ʩ�ŽǶ�,ȫ��256
	skill.nWeaponDamagePercent	= 2048;
	skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
	skill.nTargetCountLimit	= 10;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate        = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   
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
------------------------------------------------
-- �ļ���    :  �ؽ�_��彣ʽ_�Ӽ���_�׹��ɽʩ��
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
	{nAddRage = 0, nCostRage = 0, nDamageBase = 76, 	nDamageRand = 9}, -- Level 1 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 86, 	nDamageRand = 10}, -- Level 2 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 96, 	nDamageRand = 11}, -- Level 3 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 106, 	nDamageRand = 12}, -- Level 4 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 116, 	nDamageRand = 13}, -- Level 5 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 126, 	nDamageRand = 14}, -- Level 6 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 136, 	nDamageRand = 15}, -- Level 7 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 146, 	nDamageRand = 16}, -- Level 8 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 156, 	nDamageRand = 17}, -- Level 9 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 166, 	nDamageRand = 18}, -- Level 10 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 176, 	nDamageRand = 19},   	-- Level 11
	{nAddRage = 0, nCostRage = 0, nDamageBase = 186, 	nDamageRand = 20}, -- Level 12
	{nAddRage = 0, nCostRage = 0, nDamageBase = 196, 	nDamageRand = 21}, -- Level 13
	{nAddRage = 0, nCostRage = 0, nDamageBase = 206, 	nDamageRand = 22}, -- Level 14
	{nAddRage = 0, nCostRage = 0, nDamageBase = 216, 	nDamageRand = 23}, -- Level 15
	{nAddRage = 0, nCostRage = 0, nDamageBase = 226, 	nDamageRand = 24}, -- Level 16
	{nAddRage = 0, nCostRage = 0, nDamageBase = 236, 	nDamageRand = 25}, -- Level 17
	{nAddRage = 0, nCostRage = 0, nDamageBase = 246, 	nDamageRand = 26}, -- Level 18
	
};           
             

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel;
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1598,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1597,
		dwSkillLevel
		);
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL,
		9162,
		dwSkillLevel
		);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL,
		9164,
		dwSkillLevel
	);
	--]]
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);		
	--skill.SetNormalCoolDown(1, 335);

	------------------ ���ü������� ---------------------------------------------------------------------
	--skill.nCostRage	= tSkillData[dwSkillLevel].nCostRage;
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
   	--skill.nChannelInterval	= 80;
	skill.nMinRadius	= 0* LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius        = 8 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange       = 128; 										--ʩ�ŽǶ�,ȫ��256
    skill.nWeaponDamagePercent	= 0;
	--skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
	skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
    ----------------- ���˴��������� -------------------------------------------------
    skill.nBeatBackRate       = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
    --skill.nBrokenRate         = 1 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
    --skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	
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
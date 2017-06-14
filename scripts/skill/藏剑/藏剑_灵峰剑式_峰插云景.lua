------------------------------------------------
-- �ļ���    :  �ؽ�_��彣ʽ_����ƾ�.lua
-- ������    :  zhangqi	
-- ����ʱ��  :  2010-01-28
-- ��;(ģ��):  �书����
-- �书����  :  �ؽ�
-- �书����  :  �⹦
-- �书��·  :  ��彣ʽ
-- ��������  :  ����ƾ�
-- ����Ч��  :  �ϱ��߷������
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 10 ,nDamage = 14*0.95, nDamageRand = 14*0.1, nTime = 22},   	-- Level 1 
	{nAddRage = 0, nCostRage = 10 ,nDamage = 23*0.95, nDamageRand = 23*0.1, nTime = 22},   	-- Level 2 
	{nAddRage = 0, nCostRage = 10 ,nDamage = 31*0.95, nDamageRand = 31*0.1, nTime = 22},   	-- Level 3 
	{nAddRage = 0, nCostRage = 10 ,nDamage = 39*0.95, nDamageRand = 39*0.1, nTime = 22},   	-- Level 4 
	{nAddRage = 0, nCostRage = 10 ,nDamage = 47*0.95, nDamageRand = 47*0.1, nTime = 22},   	-- Level 5 
	{nAddRage = 0, nCostRage = 10 ,nDamage = 54*0.95, nDamageRand = 54*0.1, nTime = 22},   	-- Level 6 
	{nAddRage = 0, nCostRage = 10 ,nDamage = 62*0.95, nDamageRand = 62*0.1, nTime = 22},   	-- Level 7 
	{nAddRage = 0, nCostRage = 10 ,nDamage = 70*0.95, nDamageRand = 70*0.1, nTime = 22},   	-- Level 8 
	{nAddRage = 0, nCostRage = 10 ,nDamage = 78*0.95, nDamageRand = 78*0.1, nTime = 22},   	-- Level 9 
	{nAddRage = 0, nCostRage = 10 ,nDamage = 86*0.95, nDamageRand = 86*0.1, nTime = 22},   	-- Level 10 
	
};           
             

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel;

--Ӳֱ�Ӽ���
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1823,
		1
	);
	
	--skill.AddAttribute(
	--	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	--	ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
	--	1740,
	--	1
--	);
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);		
	skill.SetNormalCoolDown(1, 341);
	skill.SetCheckCoolDown(1, 444)
	----------------- ���ü������� ---------------------------------------------------------------------
	skill.nCostRage	= tSkillData[dwSkillLevel].nCostRage;
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
   	--skill.nChannelInterval	= 80;
	skill.nMinRadius	= 0* LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius        = 4 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange       = 128; 										--ʩ�ŽǶ�,ȫ��256
    skill.nWeaponDamagePercent	= 1024;
	--skill.nPrepareFrames    = 24;										--����֡��,16֡����1��
    
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
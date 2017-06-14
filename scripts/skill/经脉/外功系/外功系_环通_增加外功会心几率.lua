------------------------------------------------
-- �ļ���    : �⹦ϵ_��ͨ_�����⹦���ļ���
-- ������    : zhangqi
-- ����ʱ��  : 2009-06-08
-- ��;(ģ��): ����
-- ��������  : �⹦ϵ
-- ��������  : 
-- ����Ч��  : 
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/skill/����/VerationTable.lua")

tSkillData =
{
	{nPhysicsCriticalStrikeBaseRate = 50  },		
	{nPhysicsCriticalStrikeBaseRate = 100 },		
	{nPhysicsCriticalStrikeBaseRate = 150 },		
	{nPhysicsCriticalStrikeBaseRate = 200 },		
	{nPhysicsCriticalStrikeBaseRate = 250 },		
	{nPhysicsCriticalStrikeBaseRate = 300 },		
	{nPhysicsCriticalStrikeBaseRate = 350 },		
	{nPhysicsCriticalStrikeBaseRate = 400 },		
	{nPhysicsCriticalStrikeBaseRate = 450 },		
	{nPhysicsCriticalStrikeBaseRate = 500 },				
};          
            
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	local dwSkillLevel = skill.dwLevel;
	          
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.PHYSICS_CRITICAL_STRIKE_BASE_RATE,
		tSkillData[dwSkillLevel].nPhysicsCriticalStrikeBaseRate,
		0       
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.PHYSICS_CRITICAL_DAMAGE_POWER_BASE_KILONUM_RATE,
		tSkillData[dwSkillLevel].nPhysicsCriticalStrikeBaseRate/5,
		0       
	);	
    return true;
end


--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end

function OnSkillLevelUp(skill, player)
	if skill.dwLevel == 10 then
		 player.AcquireAchievement(123)
	end
	if player.GetSkillLevel(44) > 0 and player.GetSkillLevel(45) > 0 and not player.IsAchievementAcquired(116) then
		player.AcquireAchievement(116)
	end
	player.AddAchievementCount(1154,2)
	
	local nAchi = 0
	for i = 1,10 do
		if player.GetSkillLevel(tVenationEffectID[i]) == 10 then
			nAchi = nAchi +1
		end
	end
	if nAchi >= 10 and not player.IsAchievementAcquired(127) then
		player.AcquireAchievement(127)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
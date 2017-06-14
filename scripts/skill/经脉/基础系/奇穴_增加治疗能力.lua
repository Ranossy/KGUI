------------------------------------------------
-- �ļ���    : �����������Խű�
-- ������    : �º���
-- ����ʱ��  : 2008-07-08
-- ��;(ģ��): ����
-- ��������  : ����ϵ
-- ��������  : 
-- ����Ч��  : 
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/skill/����/VerationTable.lua")

tSkillData =
{
	{nPhysicsAttackPowerPercent = 10 },		
	{nPhysicsAttackPowerPercent = 20 },		
	{nPhysicsAttackPowerPercent = 30 },		
	{nPhysicsAttackPowerPercent = 41 },		
	{nPhysicsAttackPowerPercent = 51 },		
	{nPhysicsAttackPowerPercent = 61 },	
	{nPhysicsAttackPowerPercent = 71 },	
	{nPhysicsAttackPowerPercent = 82 },	
	{nPhysicsAttackPowerPercent = 92 },	
	{nPhysicsAttackPowerPercent = 102},				
};          
            
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	local dwSkillLevel = skill.dwLevel;
	          
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.THERAPY_POWER_PERCENT,
		tSkillData[dwSkillLevel].nPhysicsAttackPowerPercent,
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
		 player.AcquireAchievement(1423)
	end
	if player.GetSkillLevel(40) > 0 and player.GetSkillLevel(9) > 0  and player.GetSkillLevel(1206) > 0 and not player.IsAchievementAcquired(113) then
		player.AcquireAchievement(113)
	end
	player.AddAchievementCount(1422,2)
	
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
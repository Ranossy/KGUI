------------------------------------------------
-- �ļ���    :  ��ڤ����_���ǽ���.lua
-- ������    :  kingbeyond	
-- ����ʱ��  :  2007-12-11
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  ��ڤ����
-- ��������  :  ���ǽ���
-- ����Ч��  :  �����˺�����
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{	
	{nCostMana = 41},   	--level 1 
 	{nCostMana = 74},   	--level 2 
    {nCostMana = 127},  	--level 3 
    {nCostMana = 164},  	--level 4 
    {nCostMana = 200},  	--level 5 
    {nCostMana = 237},	    --level 6 
    {nCostMana = 273},	    --level 7 
    {nCostMana = 273},	    --level 8
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local bRetCode     	= false;
	local dwSkillLevel	= skill.dwLevel
	
	skill.bIsAccumulate = true;
    skill.SetSubsectionSkill(1, 1, 317, dwSkillLevel);   	-- 1����
    skill.SetSubsectionSkill(2, 2, 318, dwSkillLevel);		--
    skill.SetSubsectionSkill(3, 3, 319, dwSkillLevel);		--
    skill.SetSubsectionSkill(4, 4, 320, dwSkillLevel);		--
    skill.SetSubsectionSkill(5, 5, 321, dwSkillLevel);		--
    skill.SetSubsectionSkill(6, 6, 456, dwSkillLevel);		--
    skill.SetSubsectionSkill(7, 7, 457, dwSkillLevel);		--
    skill.SetSubsectionSkill(8, 8, 458, dwSkillLevel);		--
    skill.SetSubsectionSkill(9, 9, 459, dwSkillLevel);		--
    skill.SetSubsectionSkill(10, 10, 460, dwSkillLevel);	-- 10����
    
    
	
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    skill.SetPublicCoolDown(16);	--����CD
    skill.SetCheckCoolDown(1, 444);
	--������λ
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	if dwSkillLevel <= 7 then
		skill.nCostManaBasePercent = 420*0.65*0.2;	-- �������ĵ�����
	elseif dwSkillLevel <= 14 then
		skill.nCostManaBasePercent = 420*0.65 * 0.4;	-- �������ĵ�����
	elseif dwSkillLevel <= 21 then
		skill.nCostManaBasePercent = 420*0.65*0.6;	-- �������ĵ�����
	elseif dwSkillLevel <= 28 then
		skill.nCostManaBasePercent = 420*0.65*0.8;	-- �������ĵ�����
	else
		skill.nCostManaBasePercent = 420*0.65;	-- �������ĵ�����
	end
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0											--����ʩ����С�뾶
    skill.nMaxRadius        = 20 * LENGTH_BASE;						--����ʩ�����뾶
    skill.nAngleRange       = 128; 									--ʩ�ŽǶ�
    
    skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
 	skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
    skill.nBreakRate        = 1024;									--����ϵĸ���,Ĭ��1024��ʾһ�������

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
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(65)
	end
	--��������ָ������
	--local nQuestIndex = player.GetQuestIndex(13420)
	--local nQuestPhase = player.GetQuestPhase(13420)
	--if nQuestIndex and nQuestPhase == 1 then
		--player.SetQuestValue(nQuestIndex, 0, skill.dwLevel)
	--end
	-- if player.IsAchievementAcquired(61) and player.IsAchievementAcquired(62) and player.IsAchievementAcquired(63) and player.IsAchievementAcquired(64) and player.IsAchievementAcquired(65) and player.IsAchievementAcquired(66) and player.IsAchievementAcquired(67) then
		-- player.AcquireAchievement(72)
	-- end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
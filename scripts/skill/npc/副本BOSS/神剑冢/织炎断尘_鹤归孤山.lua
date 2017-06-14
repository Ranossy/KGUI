------------------------------------------------
-- ������   :  ֣����	
-- ����ʱ��	:  20110825
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 20 ,nDamage = 141*0.95, nDamageRand = 141*0.1, nDashSpeed = 27},   	-- Level 1 
	{nAddRage = 0, nCostRage = 20 ,nDamage = 164*0.95, nDamageRand = 164*0.1, nDashSpeed = 80},   	-- Level 2
	{nAddRage = 0, nCostRage = 20 ,nDamage = 188*0.95, nDamageRand = 188*0.1, nDashSpeed = 80},   	-- Level 3
	{nAddRage = 0, nCostRage = 20 ,nDamage = 212*0.95, nDamageRand = 212*0.1, nDashSpeed = 80},   	-- Level 4
	{nAddRage = 0, nCostRage = 20 ,nDamage = 235*0.95, nDamageRand = 235*0.1, nDashSpeed = 80},   	-- Level 5
	{nAddRage = 0, nCostRage = 20 ,nDamage = 259*0.95, nDamageRand = 259*0.1, nDashSpeed = 80}   	-- Level 6

};           
             

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DASH_FORWARD,
		12,													--12frames,�ٶ�Ϊ80��������Ϊ15��
		tSkillData[dwSkillLevel].nDashSpeed
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		3179,
		1
	);
	
	skill.AddAttribute(
	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	ATTRIBUTE_TYPE.CALL_BUFF,
	1695,
	1
	);--��ӻ�����������Buff
	

    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);	
	--skill.SetNormalCoolDown(1, 337);
	--skill.SetCheckCoolDown(1, 444);
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostRage	= tSkillData[dwSkillLevel].nCostRage;
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
   	--skill.nChannelInterval	= 80;
	skill.nMinRadius	= 0* LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius        = 8 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange       = 128; 										--ʩ�ŽǶ�,ȫ��256
    skill.nWeaponDamagePercent	= 0;
	--skill.nPrepareFrames    = 32;										--����֡��,16֡����1��
    
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

function Apply(dwCharacterID)

end

function UnApply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then 
		return
	end
	npc.CastSkill(3158,1)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
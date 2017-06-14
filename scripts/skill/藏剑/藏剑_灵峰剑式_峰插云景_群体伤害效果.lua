------------------------------------------------
-- �ļ���    :  �ؽ�_��彣ʽ_����ƾ�_�˺�Ч��.lua
-- ������    :  CBG
-- ����ʱ��  :  2010-04-28
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
	{nAddRage = 0, nCostRage = 15 ,nDamage = 14*0.95, nDamageRand = 14*0.1, nTime = 18},   	-- Level 1 
	{nAddRage = 0, nCostRage = 15 ,nDamage = 23*0.95, nDamageRand = 23*0.1, nTime = 18},   	-- Level 2 
	{nAddRage = 0, nCostRage = 15 ,nDamage = 31*0.95, nDamageRand = 31*0.1, nTime = 18},   	-- Level 3 
	{nAddRage = 0, nCostRage = 15 ,nDamage = 39*0.95, nDamageRand = 39*0.1, nTime = 18},   	-- Level 4 
	{nAddRage = 0, nCostRage = 15 ,nDamage = 47*0.95, nDamageRand = 47*0.1, nTime = 18},   	-- Level 5 
	{nAddRage = 0, nCostRage = 15 ,nDamage = 54*0.95, nDamageRand = 54*0.1, nTime = 18},   	-- Level 6 
	{nAddRage = 0, nCostRage = 15 ,nDamage = 62*0.95, nDamageRand = 62*0.1, nTime = 18},   	-- Level 7 
	{nAddRage = 0, nCostRage = 15 ,nDamage = 70*0.95, nDamageRand = 70*0.1, nTime = 18},   	-- Level 8 
	{nAddRage = 0, nCostRage = 15 ,nDamage = 78*0.95, nDamageRand = 78*0.1, nTime = 18},   	-- Level 9 
	{nAddRage = 0, nCostRage = 15 ,nDamage = 86*0.95, nDamageRand = 86*0.1, nTime = 18},   	-- Level 10 
	
};           
             

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel;

    skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_REPULSED,
		9,  --����ʱ��(֡)
    	0
    );


    
    
----- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoeeeeolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);		
	--skill.SetNormalCoolDown(1, 341);

	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostRage	= tSkillData[dwSkillLevel].nCostRage;
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
   	--skill.nChannelInterval	= 80;
	skill.nMinRadius	= 0* LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius = 5 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAreaRadius		= 6 * LENGTH_BASE;
	skill.nAngleRange       = 128; 										--ʩ�ŽǶ�,ȫ��256
    skill.nWeaponDamagePercent	= 1024;
	--skill.nPrepareFrames    = 24;										--����֡��,16֡����1��
    
	skill.nBulletVelocity   = 30;										--�ӵ��ٶ�,��/֡
    
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
	local player = GetPlayer(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if player then
		player.Stop()
		player.AddBuff(0,99,1938,1,0,0)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
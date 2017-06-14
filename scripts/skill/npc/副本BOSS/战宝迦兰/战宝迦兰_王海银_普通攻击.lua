------------------------------------------------
-- �ļ���    :  ս������_������_��ͨ����.lua
-- ������    :  CBG
-- ����ʱ��  :  2010-01-28
-- ��;(ģ��):  ����BOSS
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  
-- ����Ч��  :  ��������~��ѹ������
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 412 * 0.8, nDamageRand = 412 * 0.4, nCostMana = 0},		--level 1
	{nDamageBase = 564 * 0.8, nDamageRand = 564 * 0.4, nCostMana = 0},		--level 2
	{nDamageBase = 956 * 0.8, nDamageRand = 956 * 0.4, nCostMana = 0},		--level 3
	{nDamageBase = 1371 * 0.8, nDamageRand = 1371 * 0.4, nCostMana = 0},		--level 4
	{nDamageBase = 1995 * 0.8, nDamageRand = 1995 * 0.4, nCostMana = 0},		--level 5
	{nDamageBase = 2619 * 0.8, nDamageRand = 2619 * 0.4, nCostMana = 0},		--level 6
	{nDamageBase = 3604 * 0.8, nDamageRand = 3604 * 0.4, nCostMana = 0},		--level 7
	{nDamageBase = 4297 * 0.8, nDamageRand = 4297 * 0.4, nCostMana = 0},		--level 8
	{nDamageBase = 4990 * 0.8, nDamageRand = 4990 * 0.4, nCostMana = 0},		--level 9
	{nDamageBase = 5683 * 0.8, nDamageRand = 5683 * 0.4, nCostMana = 0},		--level 10
	{nDamageBase = 6377 * 0.8, nDamageRand = 6377 * 0.4, nCostMana = 0},		--level 11
	{nDamageBase = 7070 * 0.8, nDamageRand = 7070 * 0.4, nCostMana = 0},		--level 12
	{nDamageBase = 7763 * 0.8, nDamageRand = 7763 * 0.4, nCostMana = 0},		--level 13
	{nDamageBase = 8457 * 0.8, nDamageRand = 8457 * 0.4, nCostMana = 0},		--level 14
	{nDamageBase = 9150 * 0.8, nDamageRand = 9150 * 0.4, nCostMana = 0},		--level 15
	{nDamageBase = 10214 * 0.8, nDamageRand = 10214 * 0.4, nCostMana = 0},		--level 16
	{nDamageBase = 10445 * 0.8, nDamageRand = 10445 * 0.4, nCostMana = 0},		--level 17
	{nDamageBase = 10676 * 0.8, nDamageRand = 10676 * 0.4, nCostMana = 0},		--level 18
	{nDamageBase = 10908 * 0.8, nDamageRand = 10908 * 0.4, nCostMana = 0},		--level 19
	{nDamageBase = 11139 * 0.8, nDamageRand = 11139 * 0.4, nCostMana = 0},		--level 20
	{nDamageBase = 11370 * 0.8, nDamageRand = 11370 * 0.4, nCostMana = 0},		--level 21
	{nDamageBase = 11602 * 0.8, nDamageRand = 11602 * 0.4, nCostMana = 0},		--level 22
	{nDamageBase = 11833 * 0.8, nDamageRand = 11833 * 0.4, nCostMana = 0},		--level 23
	{nDamageBase = 12064 * 0.8, nDamageRand = 12064 * 0.4, nCostMana = 0},		--level 24
	{nDamageBase = 12295 * 0.8, nDamageRand = 12295 * 0.4, nCostMana = 0},		--level 25
	{nDamageBase = 12527 * 0.8, nDamageRand = 12527 * 0.4, nCostMana = 0},		--level 26
	{nDamageBase = 12758 * 0.8, nDamageRand = 12758 * 0.4, nCostMana = 0},		--level 27
	{nDamageBase = 12989 * 0.8, nDamageRand = 12989 * 0.4, nCostMana = 0},		--level 28
	{nDamageBase = 13221 * 0.8, nDamageRand = 13221 * 0.4, nCostMana = 0},		--level 29
	{nDamageBase = 13452 * 0.8, nDamageRand = 13452 * 0.4, nCostMana = 0},		--level 30
	{nDamageBase = 13683 * 0.8, nDamageRand = 13683 * 0.4, nCostMana = 0},		--level 31
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- ħ������ -------------------------------------------------

   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		  ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		  tSkillData[dwSkillLevel].nDamageBase * 0.14, 
		  0											
   		);
   		
   	skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
			ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
			tSkillData[dwSkillLevel].nDamageRand * 0.14, 
			0
			);	
   		
   	skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
			0, 
			0
			);	


   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,			-- ��������ģʽ
   		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- ħ������
   		"skill/npc/����BOSS/ս������/ս������_������_��ͨ����.lua",				-- ����ֵ1
   		0														-- ����ֵ2
   		);

    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
		--skill.BindBuff(1, 994, 5);		-- ����1��λBuff
		--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
		--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
		--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

    ----------------- ����Cool down --------------------------------------------
    -- ����CD
    --skill.SetPublicCoolDown(16);							-- ����CD 1.5��
    -- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
    --skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	

   	----------------- ����������� ---------------------------------------------
   	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
    --skill.dwLevelUpExp	= 0;    				-- ��������
    --skill.nExpAddOdds		= 1024;					-- ������������������
		--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
		--skill.nBaseThreat		= 0;

	----------------- �������� -------------------------------------------------
		--skill.nCostLife		= 0;									-- ������������ֵ
    --skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
    --skill.nCostStamina	= 0;									-- �������ĵ�����
    --skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
    --skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID
    
    ----------------- ������� -------------------------------------------------
    --skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
    --skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
    ----------------- ��״������� ---------------------------------------------
    --skill.nChainBranch	= 1;					--��״���ܷ�֧��
    --skill.nChainDepth		= 3;					--��״���ܲ���
    --��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
    ----------------- ʩ�ž��� -------------------------------------------------
		--skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
		skill.nMaxRadius		= 5 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
		skill.nAngleRange		= 128;					-- ������Χ�����νǶȷ�Χ 
		--skill.nAreaRadius		= 40 * LENGTH_BASE;		-- �������ð뾶 
		--skill.nTargetCountLimit	= 10;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 48;				-- ����֡��
    --skill.nChannelInterval	= 0; 				-- ͨ�������ʱ�� 
    --skill.nChannelFrame		  = 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
    --skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
    ----------------- ����� -------------------------------------------------
    --skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
    --skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
    --skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
    ----------------- Ŀ��Ѫ������ ---------------------------------------------
    --skill.nTargetLifePercentMin	= 0;			-- Ѫ����Сֵ>=
    --skill.nTargetLifePercentMax	= 100;			-- Ѫ�����ֵ<=
    
    ----------------- ����Ѫ������ ---------------------------------------------
    --skill.nSelfLifePercentMin	= 0;				-- Ѫ����Сֵ>=
    --skill.nSelfLifePercentMax	= 100;				-- Ѫ�����ֵ<=
    
    ----------------- ���˴��������� -------------------------------------------------
    --skill.nBeatBackRate       = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
    --skill.nBrokenRate         = 0 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
    --skill.nBreakRate		= 1024 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	
		--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0
	
	----------------- �����˺���� ---------------------------------------------
		--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
    return true;
end



-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)
	
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
         if not IsPlayer(dwCharacterID) then
                   return
         end
         local player = GetPlayer(dwCharacterID)
         if player then
                   local scene = player.GetScene()
                   local Parry = player.nParry
                   local ParryBase = player.nParryBaseRate
                   local ParryRate = ParryBase/100 + 100 * Parry /(Parry + 2150)
                   local npc = scene.GetNpcByNickName("boss1")                   
                   if npc then
                            if ParryRate < 30 and ParryRate >= 20 then
                                     npc.SetTarget(TARGET.PLAYER,player.dwID);
                                     npc.CastSkill(1575, 4)                                  
                            end
                            if ParryRate < 20 then
                                     npc.SetTarget(TARGET.PLAYER,player.dwID);
                                     npc.CastSkill(1575, 2)                                  
                            end
                   end
         end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
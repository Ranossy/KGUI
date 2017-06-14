------------------------------------------------
-- ������   :  �ź�		
-- ����ʱ��	:  2010-10-1
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 6200*0.8, nDamageRand = 6200*0.4, nBuffLevel = 1},		--level 1
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nBuffLevel = 1},		--level 2
	{nDamageBase = 7700*0.8, nDamageRand = 7700*0.4, nBuffLevel = 1},		--level 3
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nBuffLevel = 1},		--level 4
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nBuffLevel = 1},		--level 5
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nBuffLevel = 1},		--level 6
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nBuffLevel = 1},		--level 7
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nBuffLevel = 1},		--level 8
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nBuffLevel = 1},		--level 9
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nBuffLevel = 1},		--level 10
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nBuffLevel = 1},		--level 11
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nBuffLevel = 1},		--level 12
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nBuffLevel = 1},		--level 13
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nBuffLevel = 1},		--level 14
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nBuffLevel = 1},		--level 15
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nBuffLevel = 1},		--level 16
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nBuffLevel = 1},		--level 17
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nBuffLevel = 1},		--level 18
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nBuffLevel = 1},		--level 19
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nBuffLevel = 1},		--level 20
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nBuffLevel = 1},		--level 21
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nBuffLevel = 1},		--level 22
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nBuffLevel = 1},		--level 23
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nBuffLevel = 1},		--level 24
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nBuffLevel = 1},		--level 25
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nBuffLevel = 1},		--level 26
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nBuffLevel = 1},		--level 27
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nBuffLevel = 1},		--level 28
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nBuffLevel = 1},		--level 29
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nBuffLevel = 1},		--level 30
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- ħ������ -------------------------------------------------
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,			-- ��������ģʽ
   		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- ħ������
   		"skill/npc/����BOSS/ݶ��ʥ��/ݶ��ʥ��_8��BOSS_Ľ�ݷ���_ǧ�밵��.lua",				-- ����ֵ1
   		0														-- ����ֵ2
   	);	

	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
   --skill.AddSlowCheckDestBuff(2626,0,BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
    --skill.BindBuff(1, 2632, tSkillData[dwSkillLevel].nBuffLevel);		-- ����1��λBuff
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
	skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius		= 180 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 7;					-- ������Χ�����νǶȷ�Χ 
	skill.nAreaRadius		= 180 * LENGTH_BASE;		-- �������ð뾶 
  skill.nTargetCountLimit	= 40;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 0;				-- ����֡��
    --skill.nChannelInterval	= 0; 				-- ͨ�������ʱ�� 
    --skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
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
    skill.nBeatBackRate       = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
    --skill.nBrokenRate         = 1 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
    --skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	
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

                   local npc = scene.GetNpcByNickName("murongfuren")

                   if npc then

                            local nNow = player.nZ - npc.nZ

                            local nMax = 8 * 8 * 64

                            if nNow <= nMax then

                                     npc.SetTarget(TARGET.PLAYER,player.dwID);
                                     if scene.dwMapID ==68 then
                                     	npc.CastSkill(3068, 1)
                                     elseif scene.dwMapID ==69 then
                                     	npc.CastSkill(3068, 2) 
                                     elseif scene.dwMapID ==70 then
                                     	npc.CastSkill(3068, 3)	
                                     elseif scene.dwMapID ==72 then
                                     	npc.CastSkill(3068, 4)
                                     end	
                                    
                            end

                   end

         end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com